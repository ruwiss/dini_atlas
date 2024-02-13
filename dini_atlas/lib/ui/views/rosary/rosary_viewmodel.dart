import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/models/rosary_setting.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RosaryViewModel extends BaseViewModel {
  final _player = AudioPlayer();
  final _userSettingsService = locator<UserSettingsService>();

  void init() {
    runBusyFuture(_getRosarySetting());
  }

  RosarySetting? _rosarySetting;
  RosarySetting get rosarySetting => _rosarySetting!;

  bool _editMode = false;
  bool get editMode => _editMode;
  final _limitCountController = TextEditingController();
  TextEditingController get limitCountController => _limitCountController;
  void toggleEditMode() {
    _limitCountController.text = "";
    _editMode = !_editMode;
    notifyListeners();
  }

  bool get sound => _rosarySetting!.sound;
  bool get vibrate => _rosarySetting!.vibrate;
  int get count => _rosarySetting!.count;
  double get countPercentage => (count / limit) * 1;
  int get set => _rosarySetting!.setCount;
  int get limit => _rosarySetting!.limit;

  Future<void> _getRosarySetting() async {
    _rosarySetting = await _userSettingsService.getRosarySetting();
  }

  void _setRosarySetting() =>
      _userSettingsService.setRosarySetting(rosarySetting);

  void changeSound() {
    _rosarySetting!.sound = !_rosarySetting!.sound;
    _setRosarySetting();
    notifyListeners();
  }

  void changeVibrate() {
    _rosarySetting!.vibrate = !_rosarySetting!.vibrate;
    _setRosarySetting();
    notifyListeners();
  }

  void incrementCount() async {
    await playSoundAndVibrate();
    _rosarySetting!.count++;
    if (count >= limit) {
      _rosarySetting!.setCount++;
      _rosarySetting!.count = 0;
    }
    _setRosarySetting();
    notifyListeners();
  }

  void changeLimitCount(String text) {
    if (text.isEmpty) return;
    _rosarySetting!.limit = int.parse(text);
    resetCount();
    toggleEditMode();
    _setRosarySetting();
    notifyListeners();
  }

  void resetCount() {
    _rosarySetting!.count = 0;
    _rosarySetting!.setCount = 1;
    _setRosarySetting();
    notifyListeners();
  }

  Future<void> playSoundAndVibrate() async {
    if (sound) await _player.play(AssetSource('sounds/rosary.mp3'));
    if (vibrate) {
      int duration = 150;
      if (count + 1 == limit) duration = 500;
      Vibration.vibrate(duration: duration);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
