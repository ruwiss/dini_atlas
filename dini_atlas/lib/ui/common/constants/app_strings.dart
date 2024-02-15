//const String ksBaseUrl = "http://10.0.2.2:9976";
//const String ksBaseUrl = "http://192.168.1.104:9958";
import 'package:dini_atlas/services/remote/firebase_remote_config_service.dart';

String ksBaseUrl = FirebaseRemoteConfigServiceClass.i.host;

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
