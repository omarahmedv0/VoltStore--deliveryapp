import 'dart:io';

import 'package:deliveryapp/core/functions/navigation/pop.dart';
import 'package:dialogs/dialogs/choice_dialog.dart';

import '../constants/colors_manager.dart';

Future<bool> alertExitApp(context) {
  ChoiceDialog(
    title: 'Alert !',
    message: 'Do you want to exit the Application ?',
    
    buttonCancelText: 'Cancel',
    buttonCancelOnPressed: () {
      pop(context);
    },
    buttonCancelBorderColor: ColorsManager.primary,
    buttonOkText: 'Confirm',
    buttonOkColor: ColorsManager.primary,
    buttonOkOnPressed: () {
      exit(0);
    },
  ).show(context);

  return Future.value(false);
}
