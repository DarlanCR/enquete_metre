import 'package:flutter/material.dart';

enum Rota { enquete, confirmacao }

class LoadingPage extends StatelessWidget {
  Rota? _rota;

  LoadingPage({super.key});

  definirRota() {
    switch (_rota) {
      case Rota.enquete:
        return '/';
      case Rota.confirmacao:
        return '/confirmacao';
      case null:
        return '/config';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(20, 21, 25, 1),
      child: const CircularProgressIndicator(),
    );
  }
}
