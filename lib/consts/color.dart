import 'package:flutter/material.dart';

Color myColor = const Color.fromRGBO(254, 117, 19, 1);
MaterialColor myMaterialColor = MaterialColor(myColor.value, <int, Color>{
  50: myColor.withOpacity(0.1),
  100: myColor.withOpacity(0.2),
  200: myColor.withOpacity(0.3),
  300: myColor.withOpacity(0.4),
  400: myColor.withOpacity(0.5),
  500: myColor.withOpacity(0.6),
  600: myColor.withOpacity(0.7),
  700: myColor.withOpacity(0.8),
  800: myColor.withOpacity(0.9),
  900: myColor.withOpacity(1.0),
});
