import 'package:time_spinner/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmPmPicker extends StatelessWidget {
  final BuildContext context;
  final bool isAm;
  final ValueChanged<bool> onChanged;
  final double fontSize;
  final TextStyle? textStyle;
  final Color? color; 
  final double pickerHeight; 
  final double itemExtent;

  const AmPmPicker({
    super.key,
    required this.context,
    required this.isAm,
    required this.onChanged,
    required this.fontSize,
    this.textStyle,
    this.color, 
    required this.pickerHeight, 
    required this.itemExtent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isTablet(context) ? 250.h : pickerHeight.h,
      width: isTablet(context) ? 100.w : 80.w,
      child: ListWheelScrollView.useDelegate(
        itemExtent: isTablet(context) ? 130 : itemExtent,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          if (index == 0) onChanged(true); // AM
          if (index == 1) onChanged(false); // PM
        },
        perspective: 0.003,
        childDelegate: ListWheelChildListDelegate(
          children: [
            // AM option
            Center(
              child: Text(
                'AM',
                style: textStyle ??
                    TextStyle(
                      fontSize: isTablet(context) ? 30.sp : fontSize,
                      color: color ?? Colors.blue,
                    ),
              ),
            ),
            // PM option
            Center(
              child: Text(
                'PM',
                style: TextStyle(
                  fontSize: isTablet(context) ? 30.sp : fontSize,
                  color: color ?? Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
