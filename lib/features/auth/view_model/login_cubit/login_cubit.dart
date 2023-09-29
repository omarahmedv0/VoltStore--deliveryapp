// ignore_for_file: use_build_context_synchronously
import 'package:deliveryapp/features/auth/data/model/user_model/user_model.dart';
import 'package:deliveryapp/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/route_manager.dart';
import '../../../../core/functions/init_app.dart';
import '../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../shared/functions/check_failere_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepoImpl) : super(LoginInitial());
  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  final LoginRepoImpl _loginRepoImpl;
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  GlobalKey<FormState> formKeyForLogin = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    emit(LoginLoading());
    var response = await _loginRepoImpl.login(
      passwordControllerLogin.text,
      emailControllerLogin.text,
    );
    response.fold((failure) {
      checkFailereAuth(context, failure);
      emit(LoginFailure(failure.errMessage));
    }, (deliveryModel) {
      setdeliveryData(deliveryModel);
      toNamedandRemoveUntil(context, RouteManager.layout);
      sharedPreferences.setBool('authOK', true);
      emit(LoginSuccess());
    });
  }

  void setdeliveryData(DeliveryModel deliveryModel) {
    sharedPreferences.setString('deliveryID', deliveryModel.data!.deliveryId!);
    sharedPreferences.setString('deliveryname', deliveryModel.data!.deliveryName!);
    sharedPreferences.setString('email', deliveryModel.data!.deliveryEmail!);
    sharedPreferences.setString('password', deliveryModel.data!.deliveryPassword!);
  }

  bool obscureText = true;
  showandHidePassword() {
     if (obscureText == false) {
    obscureText = true;
  } else {
    obscureText = false;
  }
    emit(ChangeObscureTextStateLogin());
  }

  @override
  Future<void> close() async {
    emailControllerLogin.dispose();
    passwordControllerLogin.dispose();
    super.close();
  }
}
