import 'package:flutter/material.dart';

import 'package:enquete/consts/color.dart';
import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/models/background_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/enquete_controller.dart';

enum Contexto { homologacao, producao }

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final TextEditingController _controllerIp = TextEditingController();
  final TextEditingController _controllerPorta = TextEditingController();
  final TextEditingController _controllerContexto = TextEditingController();
  final ApiService _apiService = Modular.get();
  final EnqueteController _controller = Modular.get();

  Contexto? _contexto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPage(
        page: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                        controller: _controllerIp,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Endereço IP',
                            labelStyle: TextStyle(color: myColor))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 100,
                    child: TextField(
                        controller: _controllerPorta,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Porta',
                            labelStyle: TextStyle(color: myColor))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      title: const Text('Homologação',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      leading: Radio<Contexto>(
                        value: Contexto.homologacao,
                        groupValue: _contexto,
                        onChanged: (Contexto? value) {
                          setState(() {
                            _contexto = value;
                            _controllerContexto.text = '/app';
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      title: const Text('Produção',
                          style: TextStyle(color: Colors.white)),
                      leading: Radio<Contexto>(
                        value: Contexto.producao,
                        groupValue: _contexto,
                        onChanged: (Contexto? value) {
                          setState(() {
                            _contexto = value;
                            _controllerContexto.text = '';
                            debugPrint(_controllerContexto.text);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    _apiService.setBaseUrl(
                        'http://${_controllerIp.text.trim()}:${_controllerPorta.text.trim()}${_controllerContexto.text.trim()}/services/micro/');
                    _controller.getEnquete();
                    debugPrint(_apiService.dio.toString());

                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text('Configurar'))
            ],
          ),
        ),
      ),
    );
  }
}
