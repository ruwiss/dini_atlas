import 'package:dini_atlas/services/remote/firebase_remote_config_service.dart';
import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

String ksBaseUrl = FirebaseRemoteConfigServiceClass.i.host;
//String ksBaseUrl = "https://192.168.1.104:9958";

// Gizlilik Politikası
String ksPrivacyPolicy = FirebaseRemoteConfigServiceClass.i.privacyPolicy;

// Uygulama başlığı
const String ksAppName = "Dinî Atlas";

// Dil (Location Service)
const String ksDefaultLocale = "tr_TR";

// Namaz vakti geri sayım push notification bildirim kanalı
const String ksPrayerNotiChannel = "countdown_channel_atlas";

// Namaz vakti ek hatırlatıcı push notification bildirim kanalı
const String ksPrayerReminderNotiChannel = "reminder_channel_atlas";

// Mail
String ksMail = FirebaseRemoteConfigServiceClass.i.mail;

String get ksToken => md5
    .convert(utf8.encode("${DateTime.now().convertYMDtimeString()}-V47R3JNT"))
    .toString();
