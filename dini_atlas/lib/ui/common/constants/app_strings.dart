import 'package:dini_atlas/services/remote/google/firebase_remote_config_service.dart';
import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

String get ksBaseUrl => FirebaseRemoteConfigServiceClass.i.host;
//String ksBaseUrl = "https://192.168.1.104:9958";

// Gizlilik Politikası
String get ksPrivacyPolicy => FirebaseRemoteConfigServiceClass.i.privacyPolicy;

// Uygulama başlığı
const String ksAppName = "Dinî Atlas";

// Dil (Location Service)
const String ksDefaultLocale = "tr_TR";

// Namaz vakti geri sayım push notification bildirim kanalı
const String ksPrayerNotiChannel = "countdown_channel_atlas";

// Namaz vakti ek hatırlatıcı push notification bildirim kanalı
const String ksPrayerReminderNotiChannel = "reminder_channel_atlas";

// Mail
String get ksMail => FirebaseRemoteConfigServiceClass.i.mail;

String get ksToken => md5
    .convert(utf8.encode("${DateTime.now().convertYMDtimeString()}-V47R3JNT"))
    .toString();

// ---- Admob Ads ---- //
const bool ksShowAdmobAds = true;
const bool ksShowTestAds = true;

const String ksAdmobAppOpen = "";

/// Sure liste görünümü
const String ksAdmobBanner1 = "";

/// İçerik liste görünümü
const String ksAdmobBanner2 = "";

/// Elifba ekranı
const String ksAdmobBanner3 = "";

/// Kaza ekranı
const String ksAdmobBanner4 = "";

/// Pusula ekranı
const String ksAdmobBanner5 = "";

// Sure liste görünümünden içeriğe giderken
const String ksAdmobInterstitial1 = "";

// Buton aksiyonları için geçiş reklamı
const String ksAdmobInterstitial2 = "";
