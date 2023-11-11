import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  Rx<TextStyle> textTitleStyle = const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontFamily: 'monospace')
      .obs;
  Rx<TextStyle> textDescriptionStyle = const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontFamily: 'monospace')
      .obs;

  TextStyle get getTextStyle => textTitleStyle.value;
  TextStyle get getTextDescriptionStyle => textDescriptionStyle.value;

  void setTextStyle(
      {double? fontSize,
      Color? color,
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      String? fontFamily}) {
    textTitleStyle.value = textTitleStyle.value.copyWith(
        fontSize: fontSize ?? textTitleStyle.value.fontSize,
        color: color ?? textTitleStyle.value.color,
        fontStyle: fontStyle ?? textTitleStyle.value.fontStyle,
        fontWeight: fontWeight ?? textTitleStyle.value.fontWeight,
        fontFamily: fontFamily ?? textTitleStyle.value.fontFamily);
    update();
  }

  void setTextDescriptionStyle({
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
  }) {
    textDescriptionStyle.value = textDescriptionStyle.value.copyWith(
      fontSize: fontSize ?? textDescriptionStyle.value.fontSize,
      color: color ?? textDescriptionStyle.value.color,
      fontStyle: fontStyle ?? textDescriptionStyle.value.fontStyle,
      fontWeight: fontWeight ?? textDescriptionStyle.value.fontWeight,
    );
  }
}
