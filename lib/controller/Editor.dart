import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorController extends GetxController {
  Rx<Color> textTitleColor = Colors.black.obs;
  Rx<TextStyle> textTitleStyle = const TextStyle(fontSize: 16).obs;
  Rx<double> titleFontSize = 16.0.obs;
  Rx<FontStyle> titlefontStyle = Rx<FontStyle>(FontStyle.normal);
  Rx<FontWeight> titleFontWeight = Rx<FontWeight>(FontWeight.normal);

  // Getter methods to access the values
  Color get gettextTitleColor => textTitleColor.value;
  TextStyle get getTextStyle => textTitleStyle.value;
  double get getTitleFontSize => titleFontSize.value;
  FontStyle get getTitleFontStyle => titlefontStyle.value;
  FontWeight get getTitleFontWeight => titleFontWeight.value;
  // Setter methods to update the values
  void settextTitleColor(Color color) {
    textTitleColor.value = color;
    update();
  }

  void setTextTitleStyle(TextStyle style) {
    textTitleStyle.value = style;
    update();
  }

  void setTitleFontSize(double fontSize) {
    titleFontSize.value = fontSize;
    update();
  }

  // Setters for FontStyle and FontWeight
  void setFontStyle(FontStyle style) {
    titlefontStyle.value = style;
  }

  void setFontWeight(FontWeight weight) {
    titleFontWeight.value = weight;
  }
}
