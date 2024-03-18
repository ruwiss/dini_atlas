// ignore_for_file: dead_code

import 'package:dini_atlas/services/remote/google/firebase_remote_config_service.dart';
import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

const String ksAppVersion = "1.1.2";

String get ksBaseUrl => true
    ? "http://192.168.1.125:9958"
    : FirebaseRemoteConfigServiceClass.i.host;

// Uygulama başlığı
const String ksAppName = "Dinî Atlas";

// Uygulama paket adı
const String ksAppPackageName = "com.rw.dini_atlas";
String get ksAppUrl =>
    "https://play.google.com/store/apps/details?id=$ksAppPackageName";

String get ksPrivacyPolicy => FirebaseRemoteConfigServiceClass.i.privacyPolicy;

// Dil (Location Service)
const String ksDefaultLocale = "tr_TR";

// Namaz vakti geri sayım push notification bildirim kanalı
const String ksPrayerNotiChannel = "countdown_channel_atlas_5";

// Namaz vakti ek hatırlatıcı push notification bildirim kanalı
const String ksPrayerReminderNotiChannel = "reminder_channel_atlas_5";

// Mail
String get ksMail => FirebaseRemoteConfigServiceClass.i.mail;

String get ksToken => md5
    .convert(utf8.encode("${DateTime.now().convertYMDtimeString()}-V47R3JNT"))
    .toString();

// In App Purchase - Revenue Cat API
const String ksIapKey = "goog_PFeLaPWmemAgKUHceFfGGuAQTHt";

// ---- Admob Ads ---- //
const bool ksTestAds = false;
bool ksShowAdmobAds = true;

const String ksAdmobAppOpen = "ca-app-pub-1923752572867502/5356388948";

/// Sure liste görünümü
const String ksAdmobBanner1 = "ca-app-pub-1923752572867502/8337775502";

/// İçerik
const String ksAdmobBanner2 = "ca-app-pub-1923752572867502/5515584315";

/// Kaza ekranı
const String ksAdmobBanner4 = "ca-app-pub-1923752572867502/1772367150";

/// Pusula ekranı
const String ksAdmobBanner5 = "ca-app-pub-1923752572867502/9425881498";

/// Sure liste görünümünden içeriğe giderken
const String ksAdmobInterstitial1 = "ca-app-pub-1923752572867502/5647446257";

/// Buton aksiyonları için geçiş reklamı
const String ksAdmobInterstitial2 = "ca-app-pub-1923752572867502/4206958804";

/// Videosuz geçiş reklamı
const String ksAdmobInterstitital3 = "ca-app-pub-1923752572867502/3246477761";
