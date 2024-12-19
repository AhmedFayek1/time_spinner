import 'package:time_spinner/time_picker/am_pm_picker.dart';
import 'package:time_spinner/time_picker/highlighted_box.dart';
import 'package:time_spinner/time_picker/number_spinner.dart';
import 'package:time_spinner/time_picker/picker_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSpinner extends StatefulWidget {
  final String? title; 
  final void Function(DateTime)? onTimeChange;
  final bool isTwentyFourHour; // New optional parameter for 24-hour format
  final double titleAndPickerSpacing;
  final bool isOptional; // New optional parameter for optional fields
  final double fontSize;
  final double titleFontSize;
  final double pickerPadding;
  final TextStyle? textStyle;
  final TextStyle? titleStyle;
  final Color? timePickerColor;
  final Color? highlightColor;
  final double highlightedBoxBorderRadius; 
  final double pickerHeight; 
  final double itemExtent; 
  final String locale;

  const TimeSpinner({
    super.key,
    this.title,
    this.onTimeChange,
    this.isTwentyFourHour = false, // Default to 12-hour format
    this.titleAndPickerSpacing = 10.0,
    this.isOptional = false, // Default to required field
    this.fontSize = 20.0,
    this.titleFontSize = 16.0,
    this.pickerPadding = 20.0,
    this.textStyle,
    this.titleStyle,
    this.timePickerColor,
    this.highlightColor,
    this.highlightedBoxBorderRadius = 10.0, 
    this.pickerHeight = 150.0, 
    this.itemExtent = 45.0, 
    this.locale = 'en',
  });

  @override
  State<TimeSpinner> createState() => _TimeSpinnerState();
}

class _TimeSpinnerState extends State<TimeSpinner> {
  DateTime selectedTime = DateTime.now();
  bool isAm = true; // State for AM/PM toggle

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide > 600;
    final titleFontSize = isTablet ? 20.0 : widget.titleFontSize;
    final pickerFontSize = isTablet ? 25.0 : widget.fontSize;
    final spacing = isTablet ? 40.0 : 10.0;
    final double padding = widget.pickerPadding;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title
        if (widget.title != null) ... [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: PickerTitle(
              title: widget.title,
              isOptional: widget.isOptional,
              titleStyle: widget.titleStyle,
              titleFontSize: titleFontSize,
            ),
          ),
        ],

        // Time Picker
        Stack(
          alignment: Alignment.center,
          children: [
            // Highlighted Box
            HighlightedBox(
              padding: padding,
              isTablet: isTablet,
              fontSize: pickerFontSize,
              highlightColor: widget.highlightColor,
              highlightedBoxBorderRadius: widget.highlightedBoxBorderRadius,
              timePickerColor: widget.timePickerColor,
            ),

            // Time Picker Spinner
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: widget.titleAndPickerSpacing,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hour Picker
                  NumberPicker(
                    context: context, 
                    itemExtent: widget.itemExtent,
                    color: widget.timePickerColor,
                    currentValue: widget.isTwentyFourHour
                        ? selectedTime.hour
                        : (selectedTime.hour > 12
                            ? selectedTime.hour - 12
                            : (selectedTime.hour == 0
                                ? 12
                                : selectedTime.hour)),
                    minValue: widget.isTwentyFourHour ? 0 : 1,
                    maxValue: widget.isTwentyFourHour ? 23 : 12,
                    onChanged: (value) {
                      onHourChange(
                          hour: value, onTimeChange: widget.onTimeChange);
                    },
                    fontSize: pickerFontSize,
                    textStyle: widget.textStyle, 
                    pickerHeight: widget.pickerHeight,
                  ),

                  // Colon
                  Text(
                    ":",
                    style: TextStyle(
                      fontSize: isTablet ? 30.sp : pickerFontSize,
                      color: widget.timePickerColor ?? Colors.blue,
                    ),
                  ),

                  // Minute Picker
                  NumberPicker(
                    context: context, 
                    itemExtent: widget.itemExtent,
                    color: widget.timePickerColor,
                    currentValue: selectedTime.minute,
                    minValue: 0,
                    maxValue: 59,
                    onChanged: (value) {
                      onMinuteChange(
                          minute: value, onTimeChange: widget.onTimeChange);
                    },
                    fontSize: pickerFontSize,
                    textStyle: widget.textStyle, 
                    pickerHeight: widget.pickerHeight,
                  ),

                  // AM/PM Picker (only if not 24-hour format)
                  if (!widget.isTwentyFourHour) ...[
                    SizedBox(width: spacing),
                    AmPmPicker(
                      context: context, 
                      itemExtent: widget.itemExtent,
                      color: widget.timePickerColor,
                      isAm: isAm,
                      onChanged: (value) {
                        onAmPmChange(isAm: value);
                      },
                      fontSize: pickerFontSize,
                      textStyle: widget.textStyle, 
                      pickerHeight: widget.pickerHeight, 
                      locale: widget.locale,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
       
        SizedBox(height: spacing),
      ],
    );
  }

  void onHourChange(
      {required int hour, void Function(DateTime)? onTimeChange}) {
    setState(() {
      final newHour = widget.isTwentyFourHour
          ? hour // 24-hour format
          : (isAm
                  ? hour % 12 // AM hours are 0-11
                  : (hour % 12) + 12) +
              (widget.isTwentyFourHour ? 0 : 1); // PM hours are 12-23
      selectedTime = DateTime(
        selectedTime.year,
        selectedTime.month,
        selectedTime.day,
        newHour,
        selectedTime.minute,
      );
      widget.onTimeChange?.call(selectedTime);
    });
  }

  void onMinuteChange(
      {required int minute, void Function(DateTime)? onTimeChange}) {
    setState(() {
      selectedTime = DateTime(
        selectedTime.year,
        selectedTime.month,
        selectedTime.day,
        selectedTime.hour,
        minute,
      );
      widget.onTimeChange?.call(selectedTime);
    });
  }

  void onAmPmChange({required bool isAm}) {
    setState(() {
      isAm = isAm;
      final newHour = isAm
          ? selectedTime.hour % 12 // AM hours are 0-11
          : (selectedTime.hour % 12) + 12; // PM hours are 12-23
      selectedTime = DateTime(
        selectedTime.year,
        selectedTime.month,
        selectedTime.day,
        newHour,
        selectedTime.minute,
      );
      widget.onTimeChange?.call(selectedTime);
    });
  }
}
