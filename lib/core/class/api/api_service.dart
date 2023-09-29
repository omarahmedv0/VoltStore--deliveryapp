// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:deliveryapp/core/class/api/api_errors.dart';
import 'package:http/http.dart';

import '../../functions/check_api_response.dart';
import '../../functions/check_internet.dart';
import 'failures.dart';

class ApiService {
  Client http;
  Map<String, String>? headers;
  ApiService({
    required this.http,
  });
  Future<Either<Failure, Map<String, dynamic>>> getData(
    String link,
  ) async {
    try {
      if (await checkInternet() == true) {
        var response = await http.get(
          Uri.parse(link),
        );
        Map responsebody = jsonDecode(response.body);
        return checkApiResponse(response, responsebody);
      } else {
        return Left(ServerFailere(
          'No Internet',
          ApiErrors.offlinefailure,
        ));
      }
    } on ServerFailere catch (e) {
      return Left(ServerFailere(
        e.errMessage,
        ApiErrors.failure,
      ));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> postData(String link, Map data,
      {headers}) async {
    try {
      if (await checkInternet() == true) {
        var response = await http.post(
          Uri.parse(link),
          body: data,
          headers: headers,
        );
        print(response.body);
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return checkApiResponse(response, responsebody);
      } else {
        return Left(ServerFailere(
          'No Internet',
          ApiErrors.offlinefailure,
        ));
      }
    } on ServerFailere catch (e) {
      return Left(ServerFailere(
        e.errMessage,
        ApiErrors.failure,
      ));
    }
  }
}
