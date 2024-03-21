import 'package:app_not_ortalama/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_not_ortalama/configs/app_settings.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppSettings.uygulamaAd,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: AppSettings.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomePage(),
    );
  }
}
