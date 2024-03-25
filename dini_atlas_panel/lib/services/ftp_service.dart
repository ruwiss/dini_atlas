import 'dart:convert';
import 'dart:io';
import 'package:dini_atlas_panel/extensions/datetime_extensions.dart';
import 'package:dini_atlas_panel/models/story_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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
    await _connect();
  }

  final String _dailyFolder = "/api.kodlayalim.net/diniatlas/json/daily";

  Future<List<FTPEntry>> listDailyJsonFiles() async {
    try {
      await ftpConnect.changeDirectory(_dailyFolder);
      final dirItems = await ftpConnect.listDirectoryContent();
      return dirItems.where((e) => e.type == FTPEntryType.FILE).toList();
    } catch (e) {
      await _connect();
      return await listDailyJsonFiles();
    }
  }

  Future<StoryModel?> getJsonAsModel(String fileName) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fFile = File('${tempDir.path}/$fileName');
      await ftpConnect.changeDirectory(_dailyFolder);
      await ftpConnect.downloadFileWithRetry(fileName, fFile);
      final jsonObj = jsonDecode(await fFile.readAsString());
      return StoryModel.fromJson(jsonObj);
    } catch (e) {
      debugPrint(e.toString());
      await _connect();
      return await getJsonAsModel(fileName);
    }
  }

  Future<String> uploadMedia(PlatformFile platformFile,
      {bool autoFileName = false}) async {
    try {
      await ftpConnect.changeDirectory("$_dailyFolder/story_media");
      final String fileName = !autoFileName
          ? ''
          : "${DateTime.now().formatDateTimeString()}-${platformFile.name}";
      if (!await ftpConnect.existFile(platformFile.name)) {
        await ftpConnect.sendCustomCommand('TYPE I');

        await ftpConnect.uploadFileWithRetry(File(platformFile.path!),
            pRetryCount: 3, pRemoteName: fileName);
      }
      return "/story/$fileName";
    } catch (e) {
      await _connect();
      return await uploadMedia(platformFile, autoFileName: autoFileName);
    }
  }

  Future<bool> saveJsonContent({
    required String fileName,
    required Map<String, dynamic> json,
  }) async {
    try {
      await ftpConnect.changeDirectory(_dailyFolder);
      final dir = await getTemporaryDirectory();
      final file = File("${dir.path}/$fileName");
      await file.writeAsString(jsonEncode(json));
      await ftpConnect.uploadFile(file);
      return true;
    } catch (e) {
      await _connect();
      return await saveJsonContent(fileName: fileName, json: json);
    }
  }

  Future<void> removeJson(String fileName) async {
    try {
      await ftpConnect.changeDirectory(_dailyFolder);
      await ftpConnect.deleteFile(fileName);
    } catch (e) {
      await _connect();
      return await removeJson(fileName);
    }
  }

  Future<void> removeMedia(String fileName) async {
    try {
      await ftpConnect.changeDirectory("$_dailyFolder/story_media");
      await ftpConnect.deleteFile(fileName);
    } catch (e) {
      await _connect();
      return await removeMedia(fileName);
    }
  }

  Future<List<String>> getMediaFiles() async {
    try {
      await ftpConnect.changeDirectory("$_dailyFolder/story_media");
      final result = await ftpConnect.listDirectoryContentOnlyNames();
      return result;
    } catch (e) {
      await _connect();
      return await getMediaFiles();
    }
  }

  Future<void> _connect() async => ftpConnect.connect();
}
