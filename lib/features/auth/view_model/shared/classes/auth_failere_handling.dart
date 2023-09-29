import 'package:deliveryapp/core/functions/navigation/pop.dart';
import 'package:flutter/material.dart';

import '../../../../../core/class/api/failures.dart';
import '../../../../../core/functions/custom_dialog.dart';

class AuthFailereHandling {
  void otherFailereCase(BuildContext context, Failure failure) {
    customDialog(context, 'Error', failure.errMessage, 'Cancel', () {
     pop(context);
    });
  }

  void offlineFailureCase(BuildContext context) {
    customDialog(context, 'Error',
        'Please make sure you are connected to the Internet', 'Cancel', () {
     pop(context);
    });
  }

  void incorrectEmailorPasswordCase(context) {
    customDialog(context, 'Warning !', 'Incorrect E-mail or password', 'Cancel',
        () {
     pop(context);
    });
  }
}
