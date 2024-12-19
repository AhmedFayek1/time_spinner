
import 'package:flutter/material.dart';

class PickerTitle extends StatelessWidget {
  const PickerTitle({
    super.key,
    required this.titleFontSize, 
    required this.title,
    required this.isOptional,
    this.titleStyle,
  });

  final double titleFontSize; 
  final String? title;
  final bool isOptional;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichText(
        text: TextSpan(
          text: title!,
          style: titleStyle ??
              TextStyle(
                fontSize: titleFontSize,
                color: Colors.black,
              ),
          children: [
            if (isOptional)
              TextSpan(
                text: " *",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: titleFontSize,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
