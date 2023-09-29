

import 'order_data.dart';

class OrderModel {
  String? status;
  String? message;
  List<OrderData> orderData = [];
OrderModel();

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderData = (json["data"] == null ? null : (json["data"] as List).map((e) => OrderData.fromJson(e)).toList())??[];
  }


}