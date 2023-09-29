

import '../../../../features/order_details/data/models/order_details_model/address_data.dart';

class OrderData extends AddressData {
  String? orderId;
  String? orderAddressid;
  String? orderUserid;
  String? orderDeliveryprice;
  String? orderSubprice;
  String? orderTotalprice;
  String? orderDiscount;
  String? orderStatus;
  String? orderCouponid;
  String? orderPaymentmethod;
  String? orderDatetime;

  OrderData.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    orderAddressid = json["order_addressid"];
    orderUserid = json["order_userid"];
    orderDeliveryprice = json["order_deliveryprice"];
    orderSubprice = json["order_subprice"];
    orderTotalprice = json["order_totalprice"];
    orderStatus = json["status"];
    orderDiscount = json["order_discount"];
    orderCouponid = json["order_couponid"];
    orderPaymentmethod = json["order_paymentmethod"];
    orderDatetime = json["order_datetime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["order_id"] = orderId;
    data["order_addressid"] = orderAddressid;
    data["order_userid"] = orderUserid;
    data["order_deliveryprice"] = orderDeliveryprice;
    data["order_subprice"] = orderSubprice;
    data["order_totalprice"] = orderTotalprice;
    data["status"] = orderStatus;
    data["order_couponid"] = orderCouponid;
    data["order_paymentmethod"] = orderPaymentmethod;
    data["order_datetime"] = orderDatetime;

    return data;
  }
}
