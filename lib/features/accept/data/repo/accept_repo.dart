import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../../../../core/shared/models/order_model/order_model.dart';

abstract class AcceptRepo {
  Future<Either<Failure , OrderModel >>getAcceptData(String deliveryID);
  acceptOrder(String orderID ,String userID);
}