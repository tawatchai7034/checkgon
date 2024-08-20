import 'package:checkgon/styles/theme.color.dart';
import 'package:flutter/material.dart';

class ContainerStyle {
  ThemeColorApp themeColorApp = ThemeColorApp();
  BoxDecoration normal() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    );
  }

  BoxDecoration normalYellow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: themeColorApp.yellow04,
    );
  }

  BoxDecoration normalBlue() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: themeColorApp.blue04,
    );
  }
}
