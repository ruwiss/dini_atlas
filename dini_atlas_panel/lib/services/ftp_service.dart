import 'dart:convert';
import 'dart:io';

import 'package:dini_atlas_panel/models/daily_content.dart';
import 'package:dini_atlas_panel/models/story_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:path_provider/path_provider.dart';

class FTPService {
  FTPService._singleton();
  static final _instance = FTPService._singleton();
  static FTPService get instance => _instance;

  late FTPConnect ftpConnect;
  Future<void> init() async {
    ftpConnect = FTPConnect(
      'cp70.servername.co',
      user: 'kodlayalim',
      pass: 'Ankara.0660.',
      showLog: true,
    );
  }

  final String _dailyFolder = "/api.kodlayalim.net/diniatlas/json/daily";

  Future<List<FTPEntry>> listDailyJsonFiles() async {
    await _connect();
    await ftpConnect.changeDirectory(_dailyFolder);
    final dirItems = await ftpConnect.listDirectoryContent();
    await _disconnect();
    return dirItems.where((e) => e.type == FTPEntryType.FILE).toList();
  }

  Future<(StoriesModel, DailyContents)> getJsonAsModel(String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final fFile = File('${tempDir.path}/$fileName');
    await _connect();
    await ftpConnect.changeDirectory(_dailyFolder);
    await ftpConnect.downloadFileWithRetry(fileName, fFile);
    await _disconnect();
    final jsonObj = jsonDecode(await fFile.readAsString());
    final stories = StoriesModel.fromJson(jsonObj['stories']);
    final contents = DailyContents.fromJson(jsonObj['contents']);
    return (stories, contents);
  }

  Future<String> uploadMedia(PlatformFile platformFile) async {
    await _connect();
    await ftpConnect.changeDirectory("$_dailyFolder/story_media");
    if (!await ftpConnect.existFile(platformFile.name)) {
      await ftpConnect.sendCustomCommand('TYPE I');
      await ftpConnect.uploadFileWithRetry(File(platformFile.path!),
          pRetryCount: 3);
    }
    await _disconnect();
    return "/story/${platformFile.name}";
  }

  Future<bool> saveJsonContent({
    required String fileName,
    required Map<String, dynamic> json,
  }) async {
    try {
      await _connect();
      await ftpConnect.changeDirectory(_dailyFolder);
      final dir = await getTemporaryDirectory();
      final file = File("${dir.path}/$fileName");
      await file.writeAsString(jsonEncode(json));
      await ftpConnect.uploadFile(file);
      await _disconnect();
      return true;
    } catch (e) {
      await _disconnect();
      return Future.error("$e");
    }
  }

  Future<void> removeJson(String fileName) async {
    await _connect();
    await ftpConnect.changeDirectory(_dailyFolder);
    await ftpConnect.deleteFile(fileName);
    await _disconnect();
  }

  Future<void> removeMedia(String fileName) async {
    await _connect();
    await ftpConnect.changeDirectory("$_dailyFolder/story_media");
    await ftpConnect.deleteFile(fileName);
    await _disconnect();
  }

  Future<List<String>> getMediaFiles() async {
    await _connect();
    await ftpConnect.changeDirectory("$_dailyFolder/story_media");
    final result = await ftpConnect.listDirectoryContentOnlyNames();
    await _disconnect();
    return result;
  }

  Future<void> _connect() => ftpConnect.connect();
  Future<void> _disconnect() => ftpConnect.disconnect();
}
