import 'package:audioplayers/audioplayers.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/ui/views/radio/radio_service.dart';
import 'package:stacked/stacked.dart';

class RadioViewModel extends BaseViewModel {
  final _networkChecker = locator<NetworkChecker>();
  final _radioService = RadioService.instance;
  final _player = AudioPlayer();

  late List<RadioModel> _radios;
  List<RadioModel> get radios => _radios;

  String _currentPlaying = "";
  String get currentPlaying => _currentPlaying;

  void init() {
    runBusyFuture(_getRadios());
  }

  Future<void> _getRadios() async {
    final result = await _radioService.getRadios();
    result.fold((list) => _radios = list, (err) => setError(err.message));
  }

  void playRadio(String url) async {
    _currentPlaying = url;
    setBusyForObject(currentPlaying, true);
    if (_player.state == PlayerState.playing) await _player.stop();
    await _player.play(UrlSource(url));
    setBusyForObject(currentPlaying, false);
  }

  void pauseRadio() async {
    if (_player.state == PlayerState.playing) {
      await _player.pause();
      _currentPlaying = "";
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    _networkChecker.dispose();
    super.dispose();
  }
}
