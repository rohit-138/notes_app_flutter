import 'package:flutter/material.dart';

class CustomChipButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;
  final String fontFamily;

  const CustomChipButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        splashColor: Colors.transparent,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: value == groupValue
                          ? Colors.deepPurple
                          : Colors.transparent))),
          child: Text(
            fontFamily,
            style: TextStyle(
                fontFamily: fontFamily,
                color: value == groupValue ? Colors.deepPurple : Colors.black),
          ),
          onPressed: () {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
        ));
  }
}
