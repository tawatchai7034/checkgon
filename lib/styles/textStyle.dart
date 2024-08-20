import 'package:checkgon/styles/theme.color.dart';
import 'package:flutter/material.dart';

class TextStyleApp {
  ThemeColorApp themeColorApp = ThemeColorApp();
  TextStyle headerWhite01() {
    return TextStyle(
        color: themeColorApp.white, fontSize: 24, fontWeight: FontWeight.bold);
  }

  TextStyle headerWhite02() {
    return TextStyle(
        color: themeColorApp.white, fontSize: 28, fontWeight: FontWeight.bold);
  }

  TextStyle headerWhite03() {
    return TextStyle(
        color: themeColorApp.white, fontSize: 36, fontWeight: FontWeight.bold);
  }

  TextStyle headerYellow01() {
    return TextStyle(
        color: themeColorApp.yellow04,
        fontSize: 24,
        fontWeight: FontWeight.bold);
  }

  TextStyle headerYellow02() {
    return TextStyle(
        color: themeColorApp.yellow04,
        fontSize: 28,
        fontWeight: FontWeight.bold);
  }

  TextStyle headerYellow03() {
    return TextStyle(
        color: themeColorApp.yellow04,
        fontSize: 36,
        fontWeight: FontWeight.bold);
  }

  TextStyle headerBlack01() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  }

  TextStyle headerBlack02() {
    return const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  }

  TextStyle headerBlack03() {
    return const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  }

  TextStyle narmolWhite00() {
    return TextStyle(color: themeColorApp.white, fontSize: 16);
  }

  TextStyle narmolWhite01() {
    return TextStyle(color: themeColorApp.white, fontSize: 18);
  }

  TextStyle narmolWhite02() {
    return TextStyle(color: themeColorApp.white, fontSize: 24);
  }

  TextStyle narmolWhite03() {
    return TextStyle(color: themeColorApp.white, fontSize: 28);
  }

  TextStyle narmolYellow00() {
    return TextStyle(color: themeColorApp.yellow04, fontSize: 16);
  }

  TextStyle narmolYellow01() {
    return TextStyle(color: themeColorApp.yellow04, fontSize: 18);
  }

  TextStyle narmolYellow02() {
    return TextStyle(color: themeColorApp.yellow04, fontSize: 24);
  }

  TextStyle narmolYellow03() {
    return TextStyle(color: themeColorApp.yellow04, fontSize: 28);
  }

  TextStyle narmolGray00() {
    return TextStyle(color: themeColorApp.gray04, fontSize: 16);
  }

  TextStyle narmolGray01() {
    return TextStyle(color: themeColorApp.gray04, fontSize: 18);
  }

  TextStyle narmolGray02() {
    return TextStyle(color: themeColorApp.gray04, fontSize: 24);
  }

  TextStyle narmolGray03() {
    return TextStyle(color: themeColorApp.gray04, fontSize: 28);
  }
}
