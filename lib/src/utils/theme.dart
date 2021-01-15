import 'package:flutter/material.dart';
import 'package:bienes_servicios/src/utils/colors.dart';

ThemeData aplicationTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      button: base.button.copyWith(
          fontFamily: 'Open Sans',
          color: Colors.white,
          fontWeight: FontWeight.w500),
      headline1: base.headline1.copyWith(
          color: Color(0xff0f4da8),
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: 'Roboto Italic',
          fontStyle: FontStyle.normal),
      headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontFamily: 'Roboto Light',
          color: Colors.black,
          fontSize: 15),
      headline6: base.headline6.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto Light',
          color: Color(0xff5C0D78),
          fontSize: 12),
      overline: base.headline6.copyWith(
          fontStyle: FontStyle.normal,
          fontFamily: 'Open Sans',
          color: Color(0xffe60042)),
      subtitle2: base.subtitle2.copyWith(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto Italic',
        color: Color(0xff0f4da8),
      ),
      caption: base.caption.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
      bodyText1: base.bodyText1.copyWith(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontFamily: 'Open Sans',
        color: Colors.black,
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      iconTheme: IconThemeData(color: Colors.grey[800], size: 20.0, opacity: 1),
      primaryColor: Color(0xff0f4da8),
      errorColor: Color(0xffE60042),
      cardColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      indicatorColor: Color(0xFF807A6B),
      accentColor: Color(0xFFFFF8E1),
      buttonColor: Color(0xff0f4da8),
      buttonTheme: ButtonThemeData(),
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}
