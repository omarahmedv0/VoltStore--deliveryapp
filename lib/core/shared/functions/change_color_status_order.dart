import '../../constants/colors_manager.dart';
import 'package:flutter/material.dart';

Color changeColorStatusOrder(String val) {
  switch (val) {
    case '0':
      return ColorsManager.orange;
    case '1':
      return ColorsManager.blue;
    case '2':
      return ColorsManager.blue;
    case '3':
      return ColorsManager.green;
    default:
      return ColorsManager.red;
  }
}
