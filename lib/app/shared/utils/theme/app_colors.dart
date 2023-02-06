import 'package:flutter/material.dart';

class AppColor {
  //Scaffold/Dialog/BottomSheets background.
  final Color backgroundColor;

  //Main Text Color.
  final Color textColor;

  //App primary.
  final Color primaryColor;

  //App secondary.
  final Color secondaryColor;

  //App secondary light (greyish)
  final Color secondaryLightColor;

  //App tertirary
  final Color tertiaryColor;

  //App base.
  final Color baseColor;

  //Outline fields
  final Color outlineColor;

  final Color fadeColor;

  final Color textFieldLabelColor;

  final Color transactionItemIconBaseColor;

  final Color successColor;

  final Color failedColor;

  //Card
  final Color eurCardColor;

  final Color gdpCardColor;
  final Color textFieldColor;

  const AppColor({
    required this.secondaryLightColor,
    required this.backgroundColor,
    required this.textColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.baseColor,
    required this.outlineColor,
    required this.fadeColor,
    required this.textFieldLabelColor,
    required this.transactionItemIconBaseColor,
    required this.successColor,
    required this.failedColor,
    required this.eurCardColor,
    required this.gdpCardColor,
    required this.textFieldColor,
  });
}
