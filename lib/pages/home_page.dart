import 'package:app_not_ortalama/configs/app_settings.dart';
import 'package:app_not_ortalama/helpers/ders_lists_fragment.dart';
import 'package:app_not_ortalama/helpers/kredi_sec_fragment.dart';
import 'package:app_not_ortalama/helpers/puan_sec_fragment.dart';
import 'package:flutter/material.dart';
import 'package:app_not_ortalama/pages/puan_goster_page.dart';
import 'package:app_not_ortalama/datas/app_data.dart';

import '../models/ders.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            AppSettings.uygulamaAd,
            style: AppSettings.baslikStyle,
          ),
        ),
      ),
      body: const _Icerik(),
    );
  }
}

class _Icerik extends StatefulWidget {
  const _Icerik({Key? key}) : super(key: key);

  @override
  _IcerikState createState() => _IcerikState();
}

class _IcerikState extends State<_Icerik> {
  late final GlobalKey<FormState> _formKey;
  double puan = 0;
  int kredi = 1;
  String ders = '';

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _form(),
            ),
            Expanded(
              child: PuanGosterPage(
                puan: AppData.ortalamaHesapla(),
                dersSayi: AppData.tumDersler.length,
              ),
            )
          ],
        ),
        Expanded(
          child: DersListFragment(handleDismiss),
        )
      ],
    );
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Ders eklenecekDers = Ders(ad: ders, kredi: kredi, not: puan);
      _formKey.currentState!.reset();
      setState(() {
        AppData.dersEkle(eklenecekDers);
      });
    }
  }

  Widget _form() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            _dersSec(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: PuanSecFragment(
                  onPuanHandle: (value) {
                    puan = value;
                  },
                )),
                Expanded(child: KrediSecFragment(onKrediHandle: (value) {
                  kredi = value;
                })),
                IconButton(
                    onPressed: _handleSave,
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppSettings.anaRenk,
                      size: 40,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _dersSec() {
    return TextFormField(
      validator: (value) {
        if (value!.length < 5) {
          return "En az 5 karakter giriniz";
        }
        return null;
      },
      style: AppSettings.puanGosterTextStyle,
      onSaved: (value) {
        ders = value!;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: AppSettings.anaRenk.shade100.withOpacity(0.3),
          border: OutlineInputBorder(
              borderRadius: AppSettings.borderRadius,
              borderSide: BorderSide.none)),
    );
  }

  void handleDismiss(int index) {
    setState(() {
      AppData.dersSil(index);
    });
  }
}
