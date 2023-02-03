import 'package:flutter/material.dart';

backgroundPage() {
  return StreamBuilder<Object>(
    stream: null,
    builder: (context, snapshot) {
      return Container(
          color: const Color.fromRGBO(20, 21, 25, 1),
          child: Center(
              child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(31, 38, 48, 1),
            ),
          )));
    }
  );
}
