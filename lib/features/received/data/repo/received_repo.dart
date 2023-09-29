import 'package:dartz/dartz.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/shared/models/order_model/order_model.dart';

abstract class ReceivedRepo {
  Future<Either<Failure , OrderModel>>getReceivedData(String deliveryID);
}