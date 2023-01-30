import 'package:enquete/controllers/enquete_controller.dart';
import 'package:enquete/models/tipo_enquete.dart';
import 'package:enquete/models/tipo_botao.dart';
import 'package:flutter/material.dart';

class EnqueteBuild {
  final EnqueteController enqueteController;
  final PageController _pageController;
  final BuildContext context;
  ValueNotifier<bool> enableButton = ValueNotifier<bool>(false);

  EnqueteBuild(this.enqueteController, this._pageController,this.context);

  enquete(String tipo, int index) {
    switch (enqueteController.enquete.value[index].tipoQuestao) {
      case 'RATING':
        return TipoEnqueteModal(_pageController, context,
                index, enqueteController.enquete.value.length)
            .tipoEnquete(TipoEnquete.rating);
      case 'YESORNO':
        return TipoEnqueteModal(_pageController, context,
                index, enqueteController.enquete.value.length)
            .tipoEnquete(TipoEnquete.yesorno);
      case 'INPUT':
        return TipoEnqueteModal(_pageController, context,
                index, enqueteController.enquete.value.length)
            .tipoEnquete(TipoEnquete.input);
    }
  }

  buildEnquete() {
    return AnimatedBuilder(
      animation: Listenable.merge(
          [enqueteController.enquete, enqueteController.isLoad]),
      builder: (context, child) => enqueteController.isLoad.value
          ? const CircularProgressIndicator()
          : Center(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: enqueteController.enquete.value.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 500,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(31, 38, 48, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            enqueteController.enquete.value[index].questao,
                            style: const TextStyle(
                                fontSize: 35, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          enquete(
                              enqueteController
                                  .enquete.value[index].tipoQuestao,
                              index),
                          enqueteController.enquete.value[index].tipoQuestao !=
                                  'YESORNO'
                              ? TipoBotao()
                                  .confirmar(_pageController,
                                      enqueteController.enquete.value.length,
                                      index,
                                      context)
                              : Container()
                        ],
                      ),
                    ),
                    index >= 1
                        ? Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                                onPressed: () {
                                 /*  editingController.text = ''; */
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: const Text('Voltar')),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
    );
  }
}
