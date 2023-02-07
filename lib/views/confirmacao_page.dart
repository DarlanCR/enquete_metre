import 'package:enquete/controllers/enquete_controller.dart';
import 'package:enquete/models/background_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfirmacaoPage extends StatefulWidget {
  const ConfirmacaoPage({super.key});

  @override
  State<ConfirmacaoPage> createState() => _ConfirmacaoPageState();
}

class _ConfirmacaoPageState extends State<ConfirmacaoPage> {
  final EnqueteController _loadController = Modular.get();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => _loadController.isLoad.value = false);

    Future.delayed(const Duration(seconds: 8))
        .then((value) => Navigator.of(context).pushNamed('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(20, 21, 25, 1),
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: _loadController.isLoad,
            builder: (context, value, child) => _loadController.isLoad.value
                ? const CircularProgressIndicator()
                : BackgroundPage(
                    page: Column(
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
                  )),
          ),
        ));
  }
}
/* Column(
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
        ), */