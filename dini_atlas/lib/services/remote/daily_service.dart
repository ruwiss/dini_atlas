import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/daily_content.dart';
import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DailyContentTypes {
  ayetler("daily/ayetler.json", "Vaktin Ayeti"),
  dualar("daily/dualar.json", "Vaktin Duâsı"),
  hadisler("daily/hadisler.json", "Vaktin Hadisi"),
  erkekIsimleri("daily/erkek-isimleri.json", "Vaktin Bebek İsimleri"),
  kizIsimleri("daily/kiz-isimleri.json", "Vaktin Bebek İsimleri"),
  soruCevap("daily/soru-cevaplar.json", "Vaktin Sorusu");

  final String fileName;
  final String whatIs;
  const DailyContentTypes(this.fileName, this.whatIs);
}

class DailyService {
  final _dio = locator<DioService>();

  final String _dailyUrl = "/daily";
  final String _dailyZipUrl = "/daily-zip";

  final String _storiesCacheKey = "storiesMarkAsSeen";
  final String _dailyContentKey = "dailyContent";

  StoriesModel? storiesModel;
  ContentsOfTime? contentsOfTime;

  Future<void> getStories() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) return;
    if (storiesModel != null) return;

    try {
      final response = await _dio.request(_dailyUrl);
      // Cevap yoksa veya sunucu hata gönderdiyse
      if (response == null || response.statusCode != 200) return;

      storiesModel = StoriesModel.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<(List<StoryCategory>, List<Stories>)> filterStories(int type) async {
    if (storiesModel == null) throw Exception("_storiesModel is null");
    final int currentIndex =
        storiesModel!.stories.indexWhere((e) => e.type == type);
    List<Stories> storyItems = [];
    for (var i = currentIndex; i < storiesModel!.stories.length; i++) {
      storyItems.add(storiesModel!.stories[i]);
    }
    return (storiesModel!.categories, storyItems);
  }

  SharedPreferences? _prefs;
  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> markStoryAsSeen(String media) async {
    if (await isStorySeen(media)) return;
    final prefs = await _getPrefs();
    final List<String> items = prefs.getStringList(_storiesCacheKey) ?? [];
    if (items.length >= 50) items.removeRange(0, 10);
    items.add(media);
    await prefs.setStringList(_storiesCacheKey, items);
  }

  Future<bool> isStorySeen(String media) async {
    final prefs = await _getPrefs();
    final List<String> items = prefs.getStringList(_storiesCacheKey) ?? [];
    return items.contains(media);
  }

  Future<void> shareMedia(String imageUrl) async {
    try {
      final response = await Dio().get(
        imageUrl,
        options: Options(
            responseType: ResponseType.bytes, headers: {"token": ksToken}),
      );
      final Directory directory = await getTemporaryDirectory();
      final File file = await File('${directory.path}/storyImage.png')
          .writeAsBytes(response.data);
      await Share.shareXFiles(
        [XFile(file.path)],
        subject: "Dini Atlas uygulamasından: $ksAppUrl",
      );
    } catch (e) {
      debugPrint("Paylaşırken sorun oluştu $e");
    }
  }

  Future<void> getDailyContentsIfNotExists() async {
    final prefs = await _getPrefs();
    if (!prefs.containsKey(_dailyContentKey)) {
      try {
        // veriler yok, indirilmeli
        final response = await _dio.request(
          _dailyZipUrl,
          responseType: ResponseType.bytes,
        );
        if (response == null) return;

        final appTempDir = await getTemporaryDirectory();
        // Temp klasörüne indirilen zip dosyası kaydedilir
        final zipFile = File("${appTempDir.path}/dailyContents.zip");
        await zipFile.writeAsBytes(response.data);

        // Zip dosyası içerisindeki dosyalar documentDir'e çıkarılır
        final appDocDir = await getApplicationDocumentsDirectory();

        final zipBytes = File(zipFile.path).readAsBytesSync();
        final archive =
            ZipDecoder().decodeBytes(zipBytes, password: "V47R3JNT");

        for (final file in archive) {
          final filename = file.name;
          File("${appDocDir.path}/daily/$filename")
            ..createSync(recursive: true)
            ..writeAsBytesSync(file.content);
        }
        debugPrint("Daily Contents (Zip) sunucudan indirildi");
        prefs.setString(
            _dailyContentKey,
            jsonEncode({
              // 6 json için index değerleri
              // Sırayla [ayet, hadis, dua, kizIsim, erkekIsim, soruCevap]
              "index": [0, 0, 0, 0, 0, 0],
              "key": null,
            }));
      } catch (e) {
        debugPrint("Daily Service $e");
      }
    }
  }

  int _maxTry = 1;

  Future<ContentsOfTime?> getContentsOfTime(String currentType) async {
    // Güneş vakti için yeni içerik getirilmeyecek.
    if (currentType == PrayerType.gunes.name) {
      currentType = PrayerType.imsak.name;
    }
    try {
      await getDailyContentsIfNotExists();
      final prefs = await _getPrefs();
      final String? prefsData = prefs.getString(_dailyContentKey);
      if (prefsData == null) {
        if (_maxTry != 0) {
          await Future.delayed(const Duration(seconds: 2));
          _maxTry--;
          return await getContentsOfTime(currentType);
        } else {
          return null;
        }
      } else {
        final Map<String, dynamic> prefsDataMap = jsonDecode(prefsData);
        final String key = "${DateTime.now().day}_$currentType";

        if (prefsDataMap['key'] != key) {
          prefsDataMap['key'] = key;
          List<int> indexList = prefsDataMap['index'].cast<int>();
          prefsDataMap['index'] = indexList.map((e) => e + 1).toList();
        }

        final appDocDir = await getApplicationDocumentsDirectory();
        final ayetFile =
            File("${appDocDir.path}/${DailyContentTypes.ayetler.fileName}");
        final hadisFile =
            File("${appDocDir.path}/${DailyContentTypes.hadisler.fileName}");
        final duaFile =
            File("${appDocDir.path}/${DailyContentTypes.dualar.fileName}");
        final kizIsimleriFile =
            File("${appDocDir.path}/${DailyContentTypes.kizIsimleri.fileName}");
        final erkekIsimleriFile = File(
            "${appDocDir.path}/${DailyContentTypes.erkekIsimleri.fileName}");
        final soruCevaplarFile =
            File("${appDocDir.path}/${DailyContentTypes.soruCevap.fileName}");

        final ayetlerItem = jsonDecode(ayetFile.readAsStringSync()) as List;
        final hadislerItem = jsonDecode(hadisFile.readAsStringSync()) as List;
        final dualarItem = jsonDecode(duaFile.readAsStringSync()) as List;
        final kizIsimlerItem =
            jsonDecode(kizIsimleriFile.readAsStringSync()) as List;
        final erkekIsimlerItem =
            jsonDecode(erkekIsimleriFile.readAsStringSync()) as List;
        final soruCevapItem =
            jsonDecode(soruCevaplarFile.readAsStringSync()) as List;

        if (ayetlerItem.length - 1 < prefsDataMap['index'][0]) {
          prefsDataMap['index'][0] = 0;
        }
        if (hadislerItem.length - 1 < prefsDataMap['index'][1]) {
          prefsDataMap['index'][1] = 0;
        }
        if (dualarItem.length - 1 < prefsDataMap['index'][2]) {
          prefsDataMap['index'][2] = 0;
        }
        if (kizIsimlerItem.length - 1 < prefsDataMap['index'][3]) {
          prefsDataMap['index'][3] = 0;
        }
        if (erkekIsimlerItem.length - 1 < prefsDataMap['index'][4]) {
          prefsDataMap['index'][4] = 0;
        }
        if (soruCevapItem.length - 1 < prefsDataMap['index'][5]) {
          prefsDataMap['index'][5] = 0;
        }

        final ayetContent =
            AyetContent.fromJson(ayetlerItem[prefsDataMap['index'][0]]);
        final hadisContent =
            HadisContent.fromJson(hadislerItem[prefsDataMap['index'][1]]);
        final duaContent = dualarItem[prefsDataMap['index'][2]];
        final kizIsimleriContent = kizIsimlerItem[prefsDataMap['index'][3]];
        final erkekIsimleriContent = erkekIsimlerItem[prefsDataMap['index'][4]];
        final soruCevapContent =
            SoruCevapContent.fromJson(soruCevapItem[prefsDataMap['index'][5]]);

        await prefs.setString(_dailyContentKey, jsonEncode(prefsDataMap));

        return ContentsOfTime(
          ayet: ayetContent,
          hadis: hadisContent,
          dua: duaContent,
          erkekIsim: erkekIsimleriContent,
          kizIsim: kizIsimleriContent,
          soruCevap: soruCevapContent,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
