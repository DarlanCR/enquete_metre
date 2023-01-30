import 'package:enquete/controllers/botao_estado_controller.dart';
import 'package:enquete/models/rating_model.dart';
import 'package:enquete/models/tipo_botao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

enum TipoEnquete { rating, yesorno, input }

class TipoEnqueteModal {
  final PageController _pageController;
  final TextEditingController _editingController = TextEditingController();
  final BuildContext context;
  int ratingEnquete = 3;
  final int index;
  final int length;

  TipoEnqueteModal(this._pageController, this.context, this.index, this.length);

  tipoEnquete(TipoEnquete tipoEnquete) {
    switch (tipoEnquete) {
      //==========ICONES DE AVALIAÇÃO==========
      case TipoEnquete.rating:
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
                  return iconRating(
                      Icons.sentiment_satisfied, Colors.lightGreen);
                case 4:
                  return iconRating(
                      Icons.sentiment_very_satisfied, Colors.green);
              }
              return Container();
            },
            onRatingUpdate: ((rating) {
              print(TipoBotao().enableButton.value);
              ratingEnquete = rating.toInt();
              print(ratingEnquete);
            }));
//==========BOTAO SIM OU NAO==========
      case TipoEnquete.yesorno:
        return SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TipoBotao().simOuNao('Não', print('Não'), _pageController),
              TipoBotao().simOuNao('Sim', print('Sim'), _pageController)
            ],
          ),
        );

//==========CAIXA DE TEXTO==========
      case TipoEnquete.input:
        return SizedBox(
            width: 400,
            child: TextField(
                controller: _editingController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                onChanged: (value) => const BotaoEstado()));
    }
  }
}
