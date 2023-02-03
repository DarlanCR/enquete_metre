import 'package:dio/dio.dart';
import 'package:enquete/controllers/enquete_controller.dart';
import 'package:enquete/controllers/resposta_controller.dart';
import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/dio/shared_preference.dart';
import 'package:enquete/models/background_model.dart';
import 'package:enquete/models/icon_model.dart';
import 'package:enquete/models/resposta_model.dart';
import 'package:enquete/views/config_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EnquetePage extends StatefulWidget {
  const EnquetePage({super.key});

  @override
  State<EnquetePage> createState() => _EnquetePageState();
}

class _EnquetePageState extends State<EnquetePage> {
  final prefs = SharedPreferencesHelper().preferences;
  late final Dio setting;
  late final EnqueteController _controller;
  late final RespostaController _respostaController;
  final TextEditingController _editingController = TextEditingController(); 
  final PageController _pageController = PageController();

  List<Resposta> respostas = [];
  int? ratingEnquete;
  bool _enableButton = false;

  @override
  void initState() {
    setting = ApiService(prefs).dio;
    _controller = EnqueteController(setting);
    _respostaController = RespostaController(setting);
    load();
    super.initState();
  }

  load() async {
    if (_controller.client.options.baseUrl != '') {
      await _controller.getEnquete();
    }
  }

  Resposta adicionarMap(int index) {
    return Resposta(
      idEnquete: _controller.enquete.value[index].idEnquete,
      idEnqueteQuestao: _controller.enquete.value[index].idEnqueteQuestao,
      resposta: _editingController.text.trim(),
      nota: ratingEnquete,
    );
  }

  botaoConfirmar(int index) {
    if (index < _controller.enquete.value.length - 1) {
      var responseMap = adicionarMap(index);
      respostas.add(responseMap);
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);

      _enableButton = false;
      _editingController.clear();
    } else {
      var responseMap = adicionarMap(index);
      respostas.add(responseMap);
      _respostaController.postResposta(respostas);
      _editingController.clear();
      Navigator.of(context).pushNamed('/confirmacao');
    }
  }

  enqueteTipo(int index) {
    if (_controller.enquete.value[index].tipoQuestao == 'RATING') {
      return RatingBar.builder(
          initialRating: 3,
          itemCount: 5,
          itemSize: 80,
          itemPadding: const EdgeInsets.all(5),
          glow: false,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return iconRating(
                    Icons.sentiment_very_dissatisfied, Colors.red);
              case 1:
                return iconRating(
                    Icons.sentiment_dissatisfied, Colors.redAccent);
              case 2:
                return iconRating(Icons.sentiment_neutral, Colors.amber);
              case 3:
                return iconRating(Icons.sentiment_satisfied, Colors.lightGreen);
              case 4:
                return iconRating(Icons.sentiment_very_satisfied, Colors.green);
            }
            return Container();
          },
          onRatingUpdate: ((rating) {
            setState(() {
              _enableButton = true;
              ratingEnquete = rating.toInt();
            });
          }));
    } else if (_controller.enquete.value[index].tipoQuestao == 'YESORNO') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 120,
            height: 60,
            margin: const EdgeInsets.only(right: 20, top: 20),
            child: ElevatedButton(
                onPressed: () {
                  _editingController.text = 'NÃO';
                  botaoConfirmar(index);
                },
                child: const Text('NÃO')),
          ),
          Container(
            width: 120,
            height: 60,
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: ElevatedButton(
                onPressed: () {
                  _editingController.text = 'SIM';
                  botaoConfirmar(index);
                },
                child: const Text('SIM')),
          )
        ],
      );
    } else if (_controller.enquete.value[index].tipoQuestao == 'INPUT') {
      return SizedBox(
          width: 400,
          child: TextField(
            controller: _editingController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            onChanged: (value) => setState(() {
              _enableButton = true;
            }),
          ));
    }
  }

  enquete(String text, int index, String questao, bool enableButton) {
    return Center(
      child: SizedBox(
        height: 500,
        width: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            enqueteTipo(index),
            questao != 'YESORNO'
                ? SizedBox(
                    width: 120,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: _enableButton
                            ? () {
                                botaoConfirmar(index);
                              }
                            : null,
                        child: const Text('Confirmar')),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: _controller.enquete,
            builder: (context, value, child) => _controller
                    .enquete.value.isEmpty
                ? const ConfigPage()
                : Stack(
                    children: [
                      backgroundPage(),
                      Center(
                        child: PageView.builder(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _controller.enquete.value.length,
                          itemBuilder: (context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 120),
                                child: enquete(
                                    _controller.enquete.value[index].questao,
                                    index,
                                    _controller
                                        .enquete.value[index].tipoQuestao,
                                    _enableButton),
                              ),
                              index >= 1
                                  ? ElevatedButton(
                                      onPressed: () {
                                        respostas.removeLast();
                                        _editingController.clear();
                                        _pageController.previousPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.ease);
                                      },
                                      child: const Text('Voltar'))
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
  }
}
