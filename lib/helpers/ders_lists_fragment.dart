import 'package:app_not_ortalama/configs/app_settings.dart';
import 'package:app_not_ortalama/datas/app_data.dart';
import 'package:flutter/material.dart';

import '../models/ders.dart';

class DersListFragment extends StatelessWidget {
  final void Function(int) onDersSil;
  const DersListFragment(this.onDersSil, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppData.tumDersler.isNotEmpty) {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: AppData.tumDersler.length,
        itemBuilder: (context, index) {
          Ders ders = AppData.tumDersler[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              onDersSil(index);
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
