import 'package:flutter/material.dart';

class CustomAlignButton extends StatelessWidget {
  final TextAlign value;
  final TextAlign? groupValue;
  final ValueChanged<TextAlign?>? onChanged;
  final Icon icondata;
  // TextController controller;

  CustomAlignButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.icondata,
    // required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: groupValue == value ? Colors.deepPurple : Colors.black,
        onPressed: () {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        icon: icondata);
  }
}
