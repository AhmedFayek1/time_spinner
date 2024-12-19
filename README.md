TimePickerWidget

A customizable and flexible time picker widget for Flutter that supports both 12-hour and 24-hour formats. With features like AM/PM selection, hour and minute pickers, and customizable styling, it's perfect for building time selection interfaces in your Flutter applications.
Features

    Supports 12-hour and 24-hour formats.
    AM/PM Picker for 12-hour format time selection.
    Hour and Minute Picker for intuitive time selection.
    Customizable styling for both the time pickers and title.
    Color customization for the time picker and highlight colors.
    Responsive design for mobile and tablet devices.
    Optional field requirement indication with asterisk.

Installation

To use TimePickerWidget, add it as a dependency in your pubspec.yaml file:

dependencies:
  time_picker_widget: ^1.0.0

Then, run the following command to install the package:

flutter pub get

Usage

You can use the TimePickerWidget in your Flutter project like this:

import 'package:time_picker_widget/time_picker_widget.dart';

TimePickerWidget(
  title: "Select Time",
  onTimeChange: (time) {
    print("Selected time: $time");
  },
  isTwentyFourHour: false,  // Set to true for 24-hour format
  timePickerColor: Colors.blue,  // Optional color customization
  highlightColor: Colors.orange, // Optional highlight color
)

Parameters:

    title: The title to display above the picker (optional).
    onTimeChange: A callback function that provides the selected DateTime when the time is changed.
    isTwentyFourHour: Set this to true for 24-hour format, false for 12-hour format.
    titleAndPickerSpacing: Space between the title and the time picker (default: 10.0).
    isOptional: Set this to true if the field is optional (default: false).
    fontSize: Font size for the time picker digits.
    titleFontSize: Font size for the title.
    pickerPadding: Padding around the picker.
    textStyle: Custom text style for the time picker digits (optional).
    titleStyle: Custom text style for the title (optional).
    timePickerColor: Color for the time picker digits (optional).
    highlightColor: Color for the highlight background (optional).

Example:

TimePickerWidget(
  title: "Select Time",
  onTimeChange: (DateTime time) {
    print("Selected Time: $time");
  },
  isTwentyFourHour: false, 
  timePickerColor: Colors.green,
  highlightColor: Colors.yellow,
)

Customizing the Picker

You can customize the look and feel of the TimePickerWidget by changing the color and styling. The pickers for hours, minutes, and AM/PM can all be customized to match the design of your app.
Contributing

We welcome contributions to improve this package! If you have any ideas, bug fixes, or suggestions, feel free to create an issue or submit a pull request.
License

This project is licensed under the MIT License.#   t i m e _ s p i n n e r  
 #   t i m e _ s p i n n e r  
 