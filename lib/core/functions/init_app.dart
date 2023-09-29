// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../class/observer.dart';
import 'language/initial_language.dart';

late SharedPreferences sharedPreferences;
initApp() async {
  sharedPreferences = await SharedPreferences.getInstance();
  initialLanguage();
    Bloc.observer = MyBlocObserver();
}
