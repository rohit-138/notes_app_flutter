import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final Color value;
  final Color? groupValue;
  final ValueChanged<Color?>? onChanged;
  final Color color;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
        print("groupValue $groupValue");
        print("value $value");
      },
      splashColor: Colors.transparent,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: groupValue == value
                ? value == Colors.black
                    ? Colors.yellowAccent
                    : Colors.black
                : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
