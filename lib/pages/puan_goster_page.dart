import 'package:app_not_ortalama/configs/app_settings.dart';
import 'package:flutter/material.dart';

class PuanGosterPage extends StatelessWidget {
  final double puan;
  final int dersSayi;
  const PuanGosterPage({required this.puan, required this.dersSayi, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayi > 0 ? '$dersSayi Ders Girildi' : 'Ders Seçiniz',
          style: AppSettings.puanGosterTextStyle,
        ),
        Text(
          puan.toStringAsFixed(2),
          style: AppSettings.puanGosterStyle,
        ),
        Text(
          "Ortalama",
          style: AppSettings.puanGosterTextStyle,
        )
      ],
    );
  }
}
