import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:stacked/stacked.dart';

class LocationSheetModel extends BaseViewModel {
  final List<String> listItems;
  LocationSheetModel({required this.listItems}) : _filteredList = listItems;

  late List<String> _filteredList;
  List<String> get filteredList => _filteredList;

  void filter(String value) {
    if (value.trim().isEmpty) {
      _filteredList = List.from(listItems);
    } else {
      _filteredList = listItems
          .where((e) =>
              e.toLowerCaseTurkish().contains(value.toLowerCaseTurkish()))
          .toList();
    }
    notifyListeners();
  }
}
