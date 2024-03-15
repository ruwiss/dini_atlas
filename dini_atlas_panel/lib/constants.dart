import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dini_atlas_panel/extensions/datetime_extensions.dart';

const String kBaseUrl = "https://api.kodlayalim.net/diniatlas";

String get kToken => md5
    .convert(utf8.encode("${DateTime.now().convertYMDtimeString()}-V47R3JNT"))
    .toString();

Map<String, String> kHeaderWithToken = {"token": kToken};
