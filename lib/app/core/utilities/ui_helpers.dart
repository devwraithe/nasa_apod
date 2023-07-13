import 'package:flutter/material.dart';

class UiHelpers {
  // style the input field
  static inputStyle(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
