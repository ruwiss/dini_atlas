import 'dart:io';

import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/daily_content.dart';
import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyService {
  final _dio = locator<DioService>();

  final String _dailyUrl = "/daily";
  final String _storiesCacheKey = "storiesMarkAsSeen";

  StoriesModel? storiesModel;
  DailyContents? dailyContentsModel;
  Future<void> getDaily() async {
    if (storiesModel != null && dailyContentsModel != null) return;

    final response = await _dio.request(_dailyUrl);

    // Cevap yoksa veya sunucu hata gönderdiyse
    if (response == null || response.statusCode != 200) return;

    storiesModel = StoriesModel.fromJson(response.data['stories']);
    dailyContentsModel = DailyContents.fromJson(response.data['contents']);
  }

  Future<Stories> filterStories(int type) async {
    if (storiesModel == null) throw Exception("_storiesModel is null");
    return storiesModel!.stories.singleWhere((e) => e.type == type);
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
        options: Options(responseType: ResponseType.bytes),
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
}
