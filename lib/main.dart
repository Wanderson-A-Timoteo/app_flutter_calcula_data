import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:app_calcula_data/teladias.dart';
import 'package:app_calcula_data/telahoras.dart';
import 'package:app_calcula_data/telainicial.dart';
import 'package:app_calcula_data/telaminutos.dart';
import 'package:app_calcula_data/telasegundos.dart';


void main() {
  runApp(
      MaterialApp(
        title: 'Calculadora de Datas',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        routes: {
          "/": (context) => TelaInicial(),
          "/TelaDias": (context) => TelaDias(),
          "/TelaHoras": (context) => TelaHoras(),
          "/TelaMinutos": (context) => TelaMinutos(),
          "/TelaSegundos": (context) => TelaSegundos()
        },

        supportedLocales: [const Locale("pt")],
          theme: ThemeData(hintColor: Colors.pinkAccent)));
}

