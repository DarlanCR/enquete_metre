import 'package:flutter/material.dart';

class ConfirmacaoPage extends StatelessWidget {
  const ConfirmacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(20, 21, 25, 1),
        child: Center(
          child: Container(
            width: 450,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(31, 38, 48, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      'A sua resposta foi salva',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'A sua opinião é importante para que possamos melhorar',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed('/'),
                    child: const Text('Reiniciar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
