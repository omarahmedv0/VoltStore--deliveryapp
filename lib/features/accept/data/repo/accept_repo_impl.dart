import 'package:dartz/dartz.dart';
import '../../../../core/class/api/api_service.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/constants/api_links.dart';
import '../../../../core/shared/models/order_model/order_model.dart';
import 'accept_repo.dart';

class AcceptRepoImpl implements AcceptRepo {
    ApiService apiService;
  AcceptRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, OrderModel>> getAcceptData(String deliveryID)async {
     try {
      var response = await apiService.postData(ApiLinks.getAcceptedData,{
        'deliveryid':deliveryID
      });
   return   response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
  
  @override
  acceptOrder(String orderID, String userID)async {
    try {
      var response = await apiService.postData(
          ApiLinks.accept, {'userid': userID, 'orderid': orderID});
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