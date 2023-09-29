import 'package:dartz/dartz.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/shared/models/order_model/order_model.dart';

abstract class  ApproveRepo {
  Future<Either<Failure , OrderModel>> getApproveData(String deliveryID);
  approveOrder(String orderID ,String userID);
}