class DeliveryData {
  String? deliveryId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPhone;
  String? deliveryPassword;
  String? deliveryVerfiycode;
  String? deliveryApprove;
  String? deliveryTimecreate;

  DeliveryData(
      {this.deliveryId,
      this.deliveryName,
      this.deliveryEmail,
      this.deliveryPhone,
      this.deliveryPassword,
      this.deliveryVerfiycode,
      this.deliveryApprove,
      this.deliveryTimecreate});

  DeliveryData.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryEmail = json['delivery_email'];
    deliveryPhone = json['delivery_phone'];
    deliveryPassword = json['delivery_password'];
    deliveryVerfiycode = json['delivery_verfiycode'];
    deliveryApprove = json['delivery_approve'];
    deliveryTimecreate = json['delivery_timecreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_id'] = deliveryId;
    data['delivery_name'] = deliveryName;
    data['delivery_email'] = deliveryEmail;
    data['delivery_phone'] = deliveryPhone;
    data['delivery_password'] = deliveryPassword;
    data['delivery_verfiycode'] = deliveryVerfiycode;
    data['delivery_approve'] = deliveryApprove;
    data['delivery_timecreate'] = deliveryTimecreate;
    return data;
  }
}
