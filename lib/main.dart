import 'package:enquete/consts/color.dart';
import 'package:enquete/views/config_page.dart';
import 'package:enquete/views/confirmacao_page.dart';
import 'package:enquete/views/enquete_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: myMaterialColor, fontFamily: 'Poppins'),
        initialRoute: '/',
        routes: {
          '/': (context) => const EnquetePage(),
          '/confirmacao': (context) => const ConfirmacaoPage(),
          '/config': (context) => const ConfigPage(),
        },
      ),
    );
  }
}