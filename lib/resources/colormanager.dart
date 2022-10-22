import 'package:flutter/material.dart';

class ColorManager {
  static Color red = Colors.red;
  static Color orange = HexColor.fromHex('#f88417');
  static Color black = Colors.black;
  static Color lightblack = const Color.fromARGB(217, 0, 0, 0);
  static Color btngreen = HexColor.fromHex('#738b9a');
  static Color primary = HexColor.fromHex('#FFFFFF');
  static Color darkgrey = HexColor.fromHex("#525252");

  static Color grey = HexColor.fromHex('#737477');

  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');

  static Color darkprimary = HexColor.fromHex('#d17d11');

  static Color grey1 = HexColor.fromHex("#edeaea");

  static Color grey2 = const Color.fromARGB(67, 186, 186, 186);
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
