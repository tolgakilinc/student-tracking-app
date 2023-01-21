import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Providers/OrtalamaProvider.dart';
import 'package:developer_student/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//import 'package:intl/date_symbol_data_local.dart';

import 'constans.dart';

void main()=>runApp(
  MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider<OrtalamaProvider>(create: (_) => OrtalamaProvider()),
      ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
    ],
  )
);

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  int usageDuration = 0;
  DateTime _resumeTime;

  void start() {
    WidgetsBinding.instance.addObserver(this);
  }

  void stop() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _resumeTime = DateTime.now();
        break;
      case AppLifecycleState.paused:
        if (_resumeTime != null) {
          int duration = (DateTime.now().difference(_resumeTime).inSeconds);
          usageDuration += duration;
          _resumeTime = null;
        }
        break;
      default:
        break;
    }
  }

   MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      theme: ThemeData(
      //  primaryColor: kAzaleaColor,
      //  backgroundColor: kLicoriceColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );

  }
}
/*class AppLifecycleWatcher with WidgetsBindingObserver {
  int usageDuration = 0;
  DateTime _resumeTime;

  void start() {
    WidgetsBinding.instance.addObserver(this);
  }

  void stop() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _resumeTime = DateTime.now();
        break;
      case AppLifecycleState.paused:
        if (_resumeTime != null) {
          int duration = DateTime.now().difference(_resumeTime).inSeconds;
          usageDuration += duration;
          _resumeTime = null;
        }
        break;
      default:
        break;
    }
  }
}*/

class AppUsageTracker {
  // Günlük kullanım sürelerini tutan Map
  Map<DateTime, int> dailyUsage = {};

  // Uygulamanın kullanım süresini takip eden sınıf
  MyApp watcher;

  AppUsageTracker() {
    // AppLifecycleWatcher sınıfını oluştur ve başlat
    watcher = MyApp();
    watcher.start();
  }

  // Günlük kullanım süresini ekle
  void addDailyUsage() {
    // AppLifecycleWatcher sınıfından kullanım süresini al
    int duration = watcher.usageDuration;

    // Şu anki tarihi al
    DateTime today = DateTime.now();

    // Günlük kullanım sürelerine ekle
    dailyUsage[today] = duration;

    // Kullanım süresini sıfırla
    watcher.usageDuration = 0;
  }

  // Haftalık kullanım süresini hesapla ve döndür
  int getWeeklyUsage() {
    int weeklyUsage = 0;
    DateTime today = DateTime.now();
    DateTime weekAgo = today.subtract(Duration(days: 7));
    for (DateTime date in dailyUsage.keys) {
      if (date.isAfter(weekAgo) && date.isBefore(today)) {
        weeklyUsage += dailyUsage[date];
      }
    }
    return weeklyUsage;
  }
}