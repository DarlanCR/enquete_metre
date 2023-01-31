import 'package:flutter/material.dart';

botaoModel(String text, void onpress) {
  return Container(
    width: 120,
    height: 60,
    margin: const EdgeInsets.only(right: 20, top: 20),
    child: ElevatedButton(
        onPressed: () {
          onpress;
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        )),
  );
}
