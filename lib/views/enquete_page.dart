import 'package:enquete/controllers/enquete_controller.dart';
import 'package:enquete/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EnquetePage extends StatefulWidget {
  const EnquetePage({super.key});

  @override
  State<EnquetePage> createState() => _EnquetePageState();
}

class _EnquetePageState extends State<EnquetePage> {
  final EnqueteController _controller = EnqueteController();
  final TextEditingController _editingController = TextEditingController();
  final PageController _pageController = PageController();
  String yesornoEnquete = '';
  String inputEnquete = '';
  int ratingEnquete = 3;
  bool _enableButton = false;

  @override
  void initState() {
    _controller.getEnquete();
    super.initState();
  }

  enqueteTipo(int index) {
    if (_controller.enquete.value[index].tipoQuestao == 'RATING') {
      return RatingBar.builder(
          initialRating: 3,
          itemCount: 5,
          itemSize: 60,
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
      return SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 35,
              margin: const EdgeInsets.only(right: 20, top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    print('NÃO');
                    yesornoEnquete = 'NÃO';
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  child: const Text('NÃO')),
            ),
            Container(
              width: 80,
              height: 35,
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    print('SIM');
                    yesornoEnquete = 'SIM';
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  child: const Text('SIM')),
            )
          ],
        ),
      );
    } else if (_controller.enquete.value[index].tipoQuestao == 'INPUT') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 300,
              child: TextField(
                controller: _editingController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                onChanged: (value) => setState(() {
                  _enableButton = true;
                }),
              )),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(20, 21, 25, 1),
      child: Center(
        child: AnimatedBuilder(
          animation:
              Listenable.merge([_controller.enquete, _controller.isLoad]),
          builder: (context, child) => _controller.isLoad.value
              ? const CircularProgressIndicator()
              : Center(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.enquete.value.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 450,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(31, 38, 48, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                _controller.enquete.value[index].questao,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              enqueteTipo(index),
                              _controller.enquete.value[index].tipoQuestao !=
                                      'YESORNO'
                                  ? ElevatedButton(
                                      onPressed: _enableButton
                                          ? () {
                                              if (index <
                                                  _controller.enquete.value
                                                          .length -
                                                      1) {
                                                _pageController.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease);

                                                _enableButton = false;
                                                _editingController.text = '';
                                              } else {
                                                Navigator.of(context)
                                                    .pushNamed('/confirmacao');
                                              }
                                            }
                                          : null,
                                      child: const Text('Confirmar'))
                                  : Container()

                              /* print(rating);
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease); */

                              /* index < _controller.enquete.value.length - 1
                                  ? ElevatedButton(
                                      onPressed: () {
                                        _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.ease);
                                      },
                                      child: const Text('Próximo'))
                                  : ElevatedButton(
                                      onPressed: () {
                                        _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.ease);
                                      },
                                      child: const Text('Confirmar')), */
                            ],
                          ),
                        ),
                        index >= 1
                            ? ElevatedButton(
                                onPressed: () {
                                  _editingController.text = '';
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: const Text('Voltar'))
                            : Container(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    ));
  }
}
