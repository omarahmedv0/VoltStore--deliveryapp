// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:deliveryapp/core/class/api/api_service.dart';
import 'package:deliveryapp/core/class/api/failures.dart';
import 'package:deliveryapp/core/constants/api_links.dart';
import 'package:deliveryapp/core/shared/models/order_model/order_model.dart';
import 'package:deliveryapp/features/received/data/repo/received_repo.dart';

class ReceivedRepoImpl implements ReceivedRepo {
  ApiService apiService;
  ReceivedRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, OrderModel>> getReceivedData(String deliveryID)async {
   try {
      var response = await apiService.postData(ApiLinks.getReceivedData,{
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

}
