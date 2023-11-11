import 'package:flutter/material.dart';
import 'package:notes_app/controller/TextController.dart';

// ignore: must_be_immutable
class FontOptionChip extends StatelessWidget {
  final FontOption value;
  final FontOption? groupValue;
  final ValueChanged<FontOption?>? onChanged;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const FontOptionChip({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.fontWeight,
    required this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                  horizontal: 8.0), // Adjust horizontal padding
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(50.0, 36.0), // Adjust width and height
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust border radius
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.grey.shade100, // Set your desired background color
            )),
        child: Text(
          value.toString().split(".")[1],
          style: TextStyle(
              color: value == groupValue ? Colors.deepPurple : Colors.black,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: 'default'),
        ));
  }
}
