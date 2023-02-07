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

    Future.delayed(const Duration(seconds: 8), () {
      showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      ).then((value) => Navigator.of(context).pushNamed('/'));
      /*  Navigator.of(context).pushNamed('/'); */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundPage(
      page: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
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
    ));
  }
}
