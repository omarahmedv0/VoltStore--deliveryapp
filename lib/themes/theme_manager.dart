// ignore_for_file: unused_local_variable
import 'package:deliveryapp/themes/text_manager.dart';
import 'package:flutter/material.dart';

import '../core/constants/colors_manager.dart';

class ThemeManager {

  static ThemeData englishTheme = ThemeData(
    fontFamily: 'Cairo',
     floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primary,
    ),
    textTheme: textManager(),
  );


}
