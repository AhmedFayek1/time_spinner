import 'package:time_spinner/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberPicker extends StatelessWidget {
  final BuildContext context;
  final int currentValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;
  final double fontSize;
  final TextStyle? textStyle;
  final Color? color; 
  final double pickerHeight; 
  final double itemExtent;

  const NumberPicker({
    super.key,
    required this.context,
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.fontSize,
    this.textStyle,
    this.color, 
    required this.pickerHeight, 
    required this.itemExtent,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: isTablet(context) ? 250.h : pickerHeight.h,
        child: ListWheelScrollView.useDelegate(
          itemExtent: isTablet(context) ? 130 : itemExtent,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: onChanged,
          perspective: 0.003,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: List<Widget>.generate(
              maxValue - minValue + 1,
              (index) {
                final value = minValue + index;
                return Center(
                  child: Text(
                    value.toString().padLeft(2, '0'),
                    style: textStyle ??
                        TextStyle(
                          fontSize: isTablet(context) ? 30.sp : fontSize,
                          color: color ?? Colors.blue,
                        ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
