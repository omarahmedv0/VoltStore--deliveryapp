import '../../functions/check_internet.dart';
import 'api_errors.dart';

abstract class Failure {
  String errMessage;
  ApiErrors apiErrors;

  Failure(this.errMessage, this.apiErrors);
}

class ServerFailere extends Failure {
  ServerFailere(super.errMessage, super.apiErrors);

  factory ServerFailere.checkonStatuscode(int statuscode) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailere('Server Failure', ApiErrors.failure);
    } else if (statuscode == 404) {
      return ServerFailere(
          'Your request not found, Please try late !', ApiErrors.failure);
    } else if (statuscode == 500) {
      return ServerFailere(
          'Internal Server Error, Please try late !', ApiErrors.failure);
    } else if (checkInternet() == false) {
      return ServerFailere('No Internet', ApiErrors.offlinefailure);
    } else {
      return ServerFailere(
          'OPPS There Was an Error, Please try late !', ApiErrors.failure);
    }
  }
  factory ServerFailere.checkonErrormessage(String message) {
    switch (message) {
      case 'Incorrect E-mail or password':
        return ServerFailere(message, ApiErrors.incorrectEmailorpassword);
      default:
        return ServerFailere('Error', ApiErrors.failure);
    }
  }
}
