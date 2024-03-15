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

  late final bool connected;

  late FTPConnect ftpConnect;
  Future<void> connect() async {
    ftpConnect = FTPConnect(
      'cp70.servername.co',
      user: 'kodlayalim',
      pass: 'Ankara.0660.',
      showLog: true,
    );
    connected = await ftpConnect.connect();
  }

  final String _dailyFolder = "/api.kodlayalim.net/diniatlas/json/daily";

  Future<List<FTPEntry>> listDailyJsonFiles() async {
    await ftpConnect.changeDirectory(_dailyFolder);
    final dirItems = await ftpConnect.listDirectoryContent();
    return dirItems.where((e) => e.type == FTPEntryType.FILE).toList();
  }

  Future<(StoriesModel, DailyContents?)> getJsonAsModel(String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final fFile = File('${tempDir.path}/$fileName');
    final status = await ftpConnect.downloadFile(fileName, fFile);
    if (status) {
      final jsonObj = jsonDecode(await fFile.readAsString());
      final stories = StoriesModel.fromJson(jsonObj['stories']);
      final contents = DailyContents.fromJson(jsonObj['contents']);
      return (stories, contents);
    } else {
      return (StoriesModel.empty(), null);
    }
  }

  Future<String> uploadMedia(PlatformFile platformFile) async {
    await ftpConnect.changeDirectory("$_dailyFolder/story_media");
    await ftpConnect.uploadFile(File(platformFile.path!),
        sRemoteName: platformFile.name);
    await ftpConnect.changeDirectory(_dailyFolder);
    return "/story/${platformFile.name}";
  }

  void disconnect() => ftpConnect.disconnect();
}
