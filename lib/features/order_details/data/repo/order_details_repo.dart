import 'package:dartz/dartz.dart';
import '../../../../core/class/api/failures.dart';
import '../models/cities_model/cities_model.dart';
import '../models/order_details_model/order_details_model.dart';

abstract class OrderDetailsRepo {
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
    String orderID,
    String userID,
  );
  Future<Either<Failure, CitiesModel>> getCities();

}
