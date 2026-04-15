import 'package:flutter/material.dart';
import 'package:habittracker/theme/dark_mode.dart';
import 'package:habittracker/theme/light_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeData build() => lightMode; //initial mode

  //is currnent theme dark mode?
  bool get isDarkMode => state == darkMode;

  void toggleTheme() {
    if (state == darkMode) {
      state = lightMode;
    } else {
      state = darkMode;
    }
  }
}
