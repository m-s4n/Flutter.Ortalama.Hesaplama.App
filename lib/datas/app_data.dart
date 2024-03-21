import 'package:flutter/material.dart';

import '../models/ders.dart';

class AppData {
  static List<Ders> tumDersler = <Ders>[];

  static void dersEkle(Ders ders) {
    tumDersler.add(ders);
  }

  static void dersSil(int index) {
    tumDersler.removeAt(index);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    int toplamKredi = 0;

    for (Ders ders in tumDersler) {
      toplamNot += (ders.not * ders.kredi);
      toplamKredi += ders.kredi;
    }

    if (toplamKredi == 0) return 0;

    return (toplamNot / toplamKredi);
  }

  static const List<String> _notlar = [
    "AA",
    "BA",
    "BB",
    "CB",
    "CC",
    "DC",
    "DD",
    "FF"
  ];

  static List<int> _krediler() {
    return List.generate(10, (index) => (index + 1));
  }

  static double _notuDonustur(String not) {
    switch (not) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> menuNotlar() {
    return _notlar.map<DropdownMenuItem<double>>((not) {
      return DropdownMenuItem(value: _notuDonustur(not), child: Text(not));
    }).toList();
  }

  static List<DropdownMenuItem<int>> menuKrediler() {
    return _krediler().map<DropdownMenuItem<int>>((kredi) {
      return DropdownMenuItem(
        value: kredi,
        child: Text(kredi.toString()),
      );
    }).toList();
  }
}
