// ignore_for_file: must_be_immutable

import 'package:app_not_ortalama/configs/app_settings.dart';
import 'package:app_not_ortalama/datas/app_data.dart';
import 'package:flutter/material.dart';

import '../models/ders.dart';

class DersListFragment extends StatelessWidget {
  final void Function(int) onDersSil;
  final void Function(Ders) onDersEkle;
  Ders? _silinenDers;
  DersListFragment(this.onDersSil, this.onDersEkle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppData.tumDersler.isNotEmpty) {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: AppData.tumDersler.length,
        itemBuilder: (context, index) {
          Ders ders = AppData.tumDersler[index];
          return Dismissible(
            background: const Icon(
              Icons.delete_forever_outlined,
              size: 60,
              color: AppSettings.anaRenk,
            ),
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              _silinenDers = AppData.tumDersler[index];
              onDersSil(index);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text(
                  "Silindi",
                  style: TextStyle(fontSize: 20, color: AppSettings.anaRenk),
                ),
                duration: const Duration(seconds: 10),
                backgroundColor: AppSettings.anaRenk.shade100,
                action: SnackBarAction(
                  label: "Geri Al",
                  textColor: AppSettings.anaRenk,
                  onPressed: () {
                    onDersEkle(_silinenDers!);
                  },
                ),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Card(
                elevation: 5,
                color: AppSettings.anaRenk.shade100,
                child: ListTile(
                  title: Text(
                    ders.ad.toUpperCase(),
                    style: AppSettings.puanGosterTextStyle,
                  ),
                  subtitle: Text(
                      "Not: ${AppData.tumDersler[index].not} Kredi: ${AppData.tumDersler[index].kredi}"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppSettings.anaRenk,
                    child: Text((AppData.tumDersler[index].not *
                            AppData.tumDersler[index].kredi)
                        .toStringAsFixed(0)),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    return Center(
      child: Text(
        "Lütfen Ders Ekleyiniz!",
        style: AppSettings.puanGosterTextStyle,
      ),
    );
  }
}
