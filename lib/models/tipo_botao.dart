import 'package:flutter/material.dart';

class TipoBotao {
  /* final PageController _pageController;
  final BuildContext _context;
  final int index;
  final int length;
  late String texto; */
  ValueNotifier<bool> enableButton = ValueNotifier<bool>(false);

  /* TipoBotao(this._pageController, this._context, this.index, this.length); */

  simOuNao(String texto, void onpress, PageController pageController) {
    return SizedBox(
      width: 120,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            print(texto);
            pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
          child: Text(texto)),
    );
  }

  confirmar(PageController pageController, int index, int length,
      BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: enableButton,
      builder: (context, value, child) {
        if (value) {
          if (index < length - 1) {
            return ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                  enableButton.value = false;
                },
                child: const Text('Confirmar'));
          } else {
            return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/confirmacao');
                },
                child: const Text('Confirmar'));
          }
        } else {
          return const ElevatedButton(
              onPressed: null, child: Text('Confirmar'));
        }
      },
    );
  }
}
