# TimeSpinner Flutter Package

## Overview

`TimeSpinner` is a customizable time picker widget for Flutter that allows users to select time using spinner-style number pickers. It supports both 12-hour and 24-hour formats, customizable styles, and responsive design for tablets and mobile devices.

---

## Features

- **12-hour and 24-hour format support**
- **Customizable UI** for fonts, colors, and spacing
- **Optional AM/PM picker** for 12-hour format
- **Responsive design** for tablets and mobile devices
- **Optional input field** to make time selection mandatory or optional
- Seamless **callback support** to handle time changes

---

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  time_spinner: ^1.0.0
```

Run:

```bash
flutter pub get
```

---

## Usage

### Import the Package

```dart
import 'package:time_spinner/time_spinner.dart';
```

### Basic Example

```dart
TimeSpinner(
  title: "Select Time",
  onTimeChange: (DateTime selectedTime) {
    print("Selected Time: \$selectedTime");
  },
);
```

### Full Example

```dart
TimeSpinner(
  title: "Appointment Time",
  onTimeChange: (DateTime selectedTime) {
    print("Selected Time: \$selectedTime");
  },
  isTwentyFourHour: true, // Use 24-hour format
  isOptional: true, // Optional field
  fontSize: 18.0,
  titleFontSize: 20.0,
  pickerPadding: 15.0,
  textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  titleStyle: TextStyle(color: Colors.blue, fontSize: 18.0),
  timePickerColor: Colors.grey[200],
  highlightColor: Colors.blueAccent,
  highlightedBoxBorderRadius: 8.0,
  pickerHeight: 120.0,
  itemExtent: 40.0, 
  locale: 'en',
);
```

---

## Parameters

| Parameter                   | Type                   | Default Value  | Description                                                                 |
|-----------------------------|------------------------|----------------|-----------------------------------------------------------------------------|
| **title**                   | `String?`             | `null`         | Title displayed above the time spinner.                                    |
| **onTimeChange**            | `void Function(DateTime)?` | `null`         | Callback triggered when the selected time changes.                         |
| **isTwentyFourHour**        | `bool`                | `false`        | Enables 24-hour time format when set to `true`.                            |
| **titleAndPickerSpacing**   | `double`              | `10.0`         | Spacing between the title and the picker.                                  |
| **isOptional**              | `bool`                | `false`        | Allows optional fields when set to `true`.                                 |
| **fontSize**                | `double`              | `20.0`         | Font size of the spinner values.                                           |
| **titleFontSize**           | `double`              | `16.0`         | Font size of the title.                                                    |
| **pickerPadding**           | `double`              | `20.0`         | Horizontal padding for the picker.                                         |
| **textStyle**               | `TextStyle?`          | `null`         | Text style for the spinner values.                                         |
| **titleStyle**              | `TextStyle?`          | `null`         | Text style for the title.                                                  |
| **timePickerColor**         | `Color?`              | `null`         | Background color of the time picker.                                       |
| **highlightColor**          | `Color?`              | `null`         | Color of the highlighted spinner values.                                   |
| **highlightedBoxBorderRadius** | `double`            | `10.0`         | Border radius of the highlighted box.                                      |
| **pickerHeight**            | `double`              | `150.0`        | Height of the time picker.                                                 |
| **itemExtent**              | `double`              | `45.0`         | Height of each item in the spinner.                                        |
| **locale**              | `String`              | `en`         | translation based on the application locale.  
---

## Callbacks

### onTimeChange
This callback provides the selected time whenever the user changes the hour, minute, or AM/PM value.

```dart
onTimeChange: (DateTime selectedTime) {
  print("Selected Time: \$selectedTime");
},
```

---

## Responsive Design

`TimeSpinner` automatically adjusts its layout and font sizes for tablets and smaller screens:

- **Tablet Detection**: The widget uses the shortest side of the screen to differentiate between tablet and mobile devices.
- **Dynamic Font Size**: Font sizes for titles and pickers are adjusted based on the device type.

---

## Customization

You can customize the appearance of the `TimeSpinner` to match your app's design:

- **Colors**: Use `timePickerColor` and `highlightColor` to customize the picker's background and highlight colors.
- **Text Styles**: Apply custom styles for the title and picker values using `titleStyle` and `textStyle`.
- **Spacing and Sizing**: Adjust spacing, padding, and dimensions using parameters like `titleAndPickerSpacing`, `pickerPadding`, and `pickerHeight`.

---

## License

This package is released under the MIT License.

---

## Contribution

Contributions are welcome! Feel free to fork the repository and submit a pull request with your changes.
