import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HighlightedBox extends StatelessWidget {
  const HighlightedBox({
    super.key,
    required this.padding,
    required this.isTablet,
    required this.fontSize,
    required this.highlightColor,
    required this.highlightedBoxBorderRadius,
    required this.timePickerColor,
  });

  final double padding;
  final bool isTablet;
  final double fontSize;
  final Color? highlightColor;
  final double highlightedBoxBorderRadius;
  final Color? timePickerColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: padding),
        height: isTablet ? 100.h : (fontSize + 30).h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(highlightedBoxBorderRadius),
          color: highlightColor ??
              timePickerColor?.withOpacity(0.1) ??
              Colors.blue.withOpacity(0.1),
        ),
      ),
    );
  }
}
