import 'user_data.dart';

class DeliveryModel {
  String? status;
  String? message;
  DeliveryData? data;

  DeliveryModel({this.status, this.message, this.data});

  DeliveryModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = DeliveryData.fromJson(json['data'][0]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

