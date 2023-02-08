import 'package:enquete/models/background_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErroPage extends StatefulWidget {
  const ErroPage({super.key});

  @override
  State<ErroPage> createState() => _ErroPageState();
}

class _ErroPageState extends State<ErroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundPage(
      page: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(
            child: Icon(
              Icons.cancel_outlined,
              color: Colors.red,
              size: 100,
            ),
          ),
          Column(
            children: const [
              Text(
                'Erro!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Enquete não cadastrada',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () => Modular.to.navigate('/'),
                child: const Text('Tentar novamente')),
          ),
        ],
      ),
    ));
  }
}
