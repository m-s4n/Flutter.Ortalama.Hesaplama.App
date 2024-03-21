import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSettings {
  static const String uygulamaAd = "Ortalama Hesaplama App";
  static const MaterialColor anaRenk = Colors.indigo;
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontStyle: FontStyle.italic,
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: anaRenk);
  static BorderRadius borderRadius = BorderRadius.circular(20);
  static final TextStyle puanGosterTextStyle = GoogleFonts.quicksand(
      fontStyle: FontStyle.italic,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: anaRenk);

  static final TextStyle puanGosterStyle = GoogleFonts.quicksand(
      fontStyle: FontStyle.italic,
      fontSize: 40,
      fontWeight: FontWeight.w900,
      color: anaRenk);

  static const EdgeInsets elemanPadding =
      EdgeInsets.only(left: 5, top: 5, bottom: 5);

  static const EdgeInsets elemanMargin = EdgeInsets.all(5);
}
