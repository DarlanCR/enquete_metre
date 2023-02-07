import 'package:flutter/material.dart';

enum Rota { enquete, confirmacao }

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Rota? _rota;

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
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((value) => Navigator.of(context).pushNamed(definirRota()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(20, 21, 25, 1),
      child: const CircularProgressIndicator(),
    );
  }
}
