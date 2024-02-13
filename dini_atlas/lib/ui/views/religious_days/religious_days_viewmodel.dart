import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/religious_days.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:stacked/stacked.dart';

class ReligiousDaysViewModel extends BaseViewModel {
  final networkChecker = locator<NetworkChecker>();
  final _fetchTimesService = locator<FetchTimesService>();

  late List<ReligiousDays> _religiousDays;
  List<ReligiousDays> get religiousDays => _religiousDays;

  void init() {
    runBusyFuture(fetchReligiousDays());
  }

  Future<void> fetchReligiousDays() async {
    _religiousDays = await _fetchTimesService.getReligiousDays();
  }

  @override
  void dispose() {
    networkChecker.dispose();
    super.dispose();
  }
}
