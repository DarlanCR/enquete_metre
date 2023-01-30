import 'package:enquete/models/tipo_botao.dart';
import 'package:flutter/material.dart';

class BotaoEstado extends StatefulWidget {
  const BotaoEstado({super.key});

  @override
  State<BotaoEstado> createState() => _BotaoEstadoState();
}

class _BotaoEstadoState extends State<BotaoEstado> {
  _updateButtonState() {
    setState(() {
      TipoBotao().enableButton.value = true;
      print(TipoBotao().enableButton.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _updateButtonState();
  }
}
