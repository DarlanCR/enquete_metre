// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:enquete/consts/color.dart';
import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/models/background_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/enquete_controller.dart';

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
  String ip = '';
  String porta = '';
  String contexto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundPage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 200),
                      width: 300,
                      child: TextField(
                          controller: _controllerIp,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Endereço IP',
                              labelStyle: TextStyle(color: myColor))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 200, left: 20),
                      width: 100,
                      child: TextField(
                          controller: _controllerPorta,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Porta',
                              labelStyle: TextStyle(color: myColor))),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 80),
                  width: 400,
                  child: TextField(
                      controller: _controllerContexto,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Contexto',
                          labelStyle: TextStyle(color: myColor))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await _apiService.setBaseUrl(
                          'http://${_controllerIp.text.trim()}:${_controllerPorta.text.trim()}${_controllerContexto.text.trim()}/services/micro/');
                      _controller.getEnquete();
                    },
                    child: const Text('Configurar'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
