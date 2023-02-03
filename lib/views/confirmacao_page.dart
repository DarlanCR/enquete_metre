import 'package:enquete/models/background_model.dart';
import 'package:flutter/material.dart';

class ConfirmacaoPage extends StatefulWidget {
  const ConfirmacaoPage({super.key});

  @override
  State<ConfirmacaoPage> createState() => _ConfirmacaoPageState();
}

class _ConfirmacaoPageState extends State<ConfirmacaoPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 8), () => Navigator.of(context).pushNamed('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        backgroundPage(),
        const Center(
          child: Icon(
            Icons.sentiment_satisfied_outlined,
            color: Color.fromARGB(255, 27, 51, 78),
            size: 500,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Muito Obrigado!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'A sua opinião é muito importante para nós',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
