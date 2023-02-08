import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  final Widget page;

  const BackgroundPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(20, 21, 25, 1),
        child: Center(
            child: Container(
          width: 500,
          height: 570,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(31, 38, 48, 1),
          ),
          child: page,
        )));
  }
}
