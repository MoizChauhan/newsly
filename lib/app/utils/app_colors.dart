import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Color(0xffFF1570);
  static Color gradient1 = Color(0xfff4881c);
  static Color gradient2 = Color(0xffff1570);
  static Color borderColorGrey = Color(0xffEBEBEB);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color googleColor = Color(0xffFF4B26);
  static Color facebookColor = Color(0xff2196F3);
  static Color dividerColor = Color(0xffEBEBEB);
  static Color bottomNavUnactiveColor = Color(0xff959595);
  static Color starColor = Color(0xffFF9900);
  static Color greenColor = Color(0xff2ECC71);
  static Color baseColor = Colors.grey[200]!;
  static Color highlightColor = Colors.grey[100]!;
}

enum ColorShade {
  lightest,
  secondLightest,
  thirdLightest,
  fourthLightest,
  fifthLightest,
  normal,
  fourthDarkest,
  thirdDarkest,
  secondDarkest,
  darkest,
}

const Map<ColorShade, int> shades = <ColorShade, int>{
  ColorShade.lightest: 50,
  ColorShade.secondLightest: 100,
  ColorShade.thirdLightest: 200,
  ColorShade.fourthLightest: 300,
  ColorShade.fifthLightest: 400,
  ColorShade.normal: 500,
  ColorShade.fourthDarkest: 600,
  ColorShade.thirdDarkest: 700,
  ColorShade.secondDarkest: 800,
  ColorShade.darkest: 900,
};
MaterialColor getMaterialColor(Color color) {
  return Colors.primaries.firstWhere(
    (MaterialColor c) => c.value == color.value,
    orElse: () => MaterialColor(
      color.value,
      <int, Color>{
        shades[ColorShade.lightest]!: color,
        shades[ColorShade.secondLightest]!: color,
        shades[ColorShade.thirdLightest]!: color,
        shades[ColorShade.fourthLightest]!: color,
        shades[ColorShade.fifthLightest]!: color,
        shades[ColorShade.normal]!: color,
        shades[ColorShade.fourthDarkest]!: color,
        shades[ColorShade.thirdDarkest]!: color,
        shades[ColorShade.secondDarkest]!: color,
        shades[ColorShade.darkest]!: color,
      },
    ),
  );
}
