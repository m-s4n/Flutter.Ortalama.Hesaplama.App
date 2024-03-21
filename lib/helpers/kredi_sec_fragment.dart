// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../configs/app_settings.dart';
import '../datas/app_data.dart';

class KrediSecFragment extends StatefulWidget {
  final void Function(int) onKrediHandle;
  const KrediSecFragment({required this.onKrediHandle, Key? key})
      : super(key: key);

  @override
  _KrediSecFragmentState createState() => _KrediSecFragmentState();
}

class _KrediSecFragmentState extends State<KrediSecFragment> {
  int kredi = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSettings.elemanMargin,
      padding: AppSettings.elemanPadding,
      decoration: BoxDecoration(
          color: AppSettings.anaRenk.shade100.withOpacity(0.3),
          borderRadius: AppSettings.borderRadius),
      child: DropdownButtonFormField<int>(
        onSaved: (newValue) {
          kredi = newValue!;
        },
        decoration: const InputDecoration(border: InputBorder.none),
        alignment: Alignment.center,
        elevation: 16,
        iconEnabledColor: AppSettings.anaRenk.shade200,
        value: kredi,
        hint: const Text("Kredi Seç"),
        items: AppData.menuKrediler(),
        onChanged: (value) {
          setState(() {
            kredi = value!;
            widget.onKrediHandle(value);
          });
        },
      ),
    );
  }
}
