import 'package:checkgon/styles/textStyle.dart';
import 'package:checkgon/styles/theme.color.dart';
import 'package:flutter/material.dart';

class FormStyle {
  ThemeColorApp themeColorApp = ThemeColorApp();
  Widget textFieldNormal(String hintText,Function onSubmit, Function onChange) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        prefixIcon: Icon(Icons.search, color: themeColorApp.gray04),
        hintText: hintText,
        hintStyle: TextStyle(color: themeColorApp.gray04),
        filled: true,
        fillColor: themeColorApp.white,
      ),
      onFieldSubmitted: (value) {
        onSubmit(value);
      },
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}
