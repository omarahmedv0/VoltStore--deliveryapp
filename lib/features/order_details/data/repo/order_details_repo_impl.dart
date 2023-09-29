// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:deliveryapp/core/class/api/api_service.dart';
import 'package:deliveryapp/core/class/api/failures.dart';
import 'package:deliveryapp/core/constants/api_links.dart';
import 'package:deliveryapp/features/order_details/data/models/cities_model/cities_model.dart';
import 'package:deliveryapp/features/order_details/data/models/order_details_model/order_details_model.dart';
import 'package:deliveryapp/features/order_details/data/repo/order_details_repo.dart';


class OrderDetailsRepoImpl implements OrderDetailsRepo {
  ApiService apiService;
  OrderDetailsRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
    String orderID,
    String deliveryID,
  ) async {
    try {
      var response = await apiService.postData(
          ApiLinks.getOrderDetails, {'deliveryid': deliveryID, 'orderId': orderID});
      return response.fold((failere) {
        return left(failere);
      }, (orderModel) {
        return right(OrderDetailsModel.fromJson(orderModel));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

      @override
  Future<Either<Failure, CitiesModel>> getCities() async {
    try {
      var response = await apiService.postData(ApiLinks.getCities, {});
      return response.fold(
        (failere) => left(failere),
        (data) => right(
          CitiesModel.fromJson(data),
        ),
      );
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }
}
