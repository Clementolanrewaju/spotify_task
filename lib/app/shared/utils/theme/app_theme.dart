import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  late AppColor appColor;

  AppTheme(this.appColor);

  static AppTheme light() {
    var appColor = const AppColor(
      backgroundColor: Color(0xff000000),
      textColor: Color(0xffFFFFFF),
      eurCardColor: Color.fromRGBO(85, 20, 59, 1),
      gdpCardColor: Color.fromRGBO(0, 0, 0, 1),
      primaryColor: Color(0xFF161455),
      secondaryLightColor: Color(0xFF6B7280),
      secondaryColor: Color(0xffC4C4C4),
      tertiaryColor: Color(0xff767676),
      baseColor: Color(0xffFED8B8),
      outlineColor: Color(0xffE9E9F8),
      fadeColor: Color(0xff050826),
      textFieldLabelColor: Color(0xff000000),
      transactionItemIconBaseColor: Color(0xff9787BE),
      successColor: Color(0xff06B856),
      failedColor: Color(0xffE04848),
      textFieldColor: Color(0xffFFFFFF),
    );
    return AppTheme(appColor);
  }

  static AppTheme dark() {
    // var _appColor = const AppColor(
    //   backgroundColor: Color(0xffFFFFFF),
    //   textColor: Color(0xff000000),
    //   primaryColor: Color(0xFF161455),
    // );
    return light();
  }
}
