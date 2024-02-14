import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class EsmaulHusnaViewModel extends BaseViewModel {
  Future<List<EsmaulHusna>> getEsmaulHusnaData() async {
    final dataString =
        await rootBundle.loadString('assets/docs/esmaul_husna.json');
    final List dataList = jsonDecode(dataString);

    return dataList.map((e) => EsmaulHusna.fromJson(e)).toList();
  }
}

class EsmaulHusna {
  final String text;
  final String mean;

  EsmaulHusna(this.text, this.mean);

  EsmaulHusna.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        mean = json['mean'];
}
