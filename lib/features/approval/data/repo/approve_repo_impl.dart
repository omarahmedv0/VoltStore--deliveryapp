// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:deliveryapp/core/class/api/api_service.dart';
import 'package:deliveryapp/core/class/api/failures.dart';
import 'package:deliveryapp/core/constants/api_links.dart';
import 'package:deliveryapp/core/shared/models/order_model/order_model.dart';
import 'package:deliveryapp/features/approval/data/repo/approve_repo.dart';

class ApproveRepoImpl implements ApproveRepo {
  ApiService apiService;
  ApproveRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, OrderModel>> getApproveData(String deliveryID) async {
    try {
      var response = await apiService
          .postData(ApiLinks.getApproveData, {'deliveryid': deliveryID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  approveOrder(String orderID, String userID) async {
    try {
      var response = await apiService.postData(
          ApiLinks.approve, {'userid': userID, 'orderid': orderID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
}
