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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Obrigado',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'A sua opinião é importante para que possamos melhorar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
