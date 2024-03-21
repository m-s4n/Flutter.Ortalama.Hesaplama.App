// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../configs/app_settings.dart';
import '../datas/app_data.dart';

class PuanSecFragment extends StatefulWidget {
  final void Function(double) onPuanHandle;
  const PuanSecFragment({required this.onPuanHandle, Key? key})
      : super(key: key);

  @override
  _PuanSecFragmentState createState() => _PuanSecFragmentState();
}

class _PuanSecFragmentState extends State<PuanSecFragment> {
  double puan = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSettings.elemanMargin,
      padding: AppSettings.elemanPadding,
      decoration: BoxDecoration(
          color: AppSettings.anaRenk.shade100.withOpacity(0.3),
          borderRadius: AppSettings.borderRadius),
      child: DropdownButtonFormField<double>(
        onSaved: (newValue) {
          puan = newValue!;
        },
        decoration: const InputDecoration(border: InputBorder.none),
        alignment: Alignment.center,
        elevation: 16,
        iconEnabledColor: AppSettings.anaRenk.shade200,
        value: puan,
        hint: const Text("Puan Seç"),
        items: AppData.menuNotlar(),
        onChanged: (value) {
          setState(() {
            puan = value!;
            widget.onPuanHandle(value);
          });
        },
      ),
    );
  }
}
