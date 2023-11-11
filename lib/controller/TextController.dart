import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FontOption { regular, bold, italic }
class TextController extends GetxController {
  Rx<FontOption> fontOption = FontOption.regular.obs;
  Rx<FontOption> descFontOption = FontOption.regular.obs;
  Rx<TextAlign> titleAlignment = TextAlign.left.obs;
  Rx<TextAlign> descriptionAlignment = TextAlign.left.obs;
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
  TextAlign get getTitleAlignment => titleAlignment.value;
  TextAlign get getDescriptionAlignment => descriptionAlignment.value;
  FontOption get getFontOption => fontOption.value;
  FontOption get getDescFontOption => descFontOption.value;

  void setTitleAlignment(TextAlign textAlign) {
    titleAlignment.value = textAlign;
  }

  void setDescriptionAlignment(TextAlign textAlign) {
    descriptionAlignment.value = textAlign;
  }
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
      String? fontFamily

  }) {
    textDescriptionStyle.value = textDescriptionStyle.value.copyWith(
      fontSize: fontSize ?? textDescriptionStyle.value.fontSize,
      color: color ?? textDescriptionStyle.value.color,
      fontStyle: fontStyle ?? textDescriptionStyle.value.fontStyle,
      fontWeight: fontWeight ?? textDescriptionStyle.value.fontWeight,
        fontFamily: fontFamily ?? textDescriptionStyle.value.fontFamily

    );
    update();
  }

  void setFontOption(FontOption option) {
    fontOption.value = option;
    switch (option) {
      case FontOption.regular:
        setTextStyle(
            fontStyle: FontStyle.normal, fontWeight: FontWeight.normal);
        break;
      case FontOption.italic:
        setTextStyle(fontStyle: FontStyle.italic);
        break;
      case FontOption.bold:
        setTextStyle(fontWeight: FontWeight.bold);

        break;
      default:
    }
    update();
  }

  void setDescFontOption(FontOption option) {
    fontOption.value = option;
    switch (option) {
      case FontOption.regular:
        setTextDescriptionStyle(
            fontStyle: FontStyle.normal, fontWeight: FontWeight.normal);
        break;
      case FontOption.italic:
        setTextDescriptionStyle(fontStyle: FontStyle.italic);
        break;
      case FontOption.bold:
        setTextDescriptionStyle(fontWeight: FontWeight.bold);

        break;
      default:
    }
    update();
  }
}
