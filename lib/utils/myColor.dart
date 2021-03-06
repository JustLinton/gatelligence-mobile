import 'package:flutter/material.dart';

MaterialColor gateAccentColor = createMaterialColor(const Color.fromARGB(255,120, 140, 246));
MaterialColor gateAccentLightColor = createMaterialColor(Color.fromARGB(255, 192, 201, 239));
MaterialColor gateAccentExLightColor =createMaterialColor(Color.fromARGB(255, 202, 207, 233));
Color gateAccentColot_nm= const Color.fromARGB(255,120, 140, 246);
Color gateIconColor= Colors.black38;
Color gateDisabledColor = Colors.black12;

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
