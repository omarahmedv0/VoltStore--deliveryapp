class ApiLinks {
  // static const _baseUrl = 'http://10.0.2.2/e-commerce-app';
  static const _baseUrl = 'http://192.168.1.9/e-commerce-app';

  //------------------------- IMAGES------------------------
  static const productsImagesLink = '$_baseUrl/upload/products';

  //------------------------- AUTH------------------------
  static const login = '$_baseUrl/delivery/auth/login.php';

  //------------------------- MY Orders ------------------------
  static const getReceivedData =
      '$_baseUrl/delivery/orders/get_received_data.php';
  static const getAcceptedData =
      '$_baseUrl/delivery/orders/get_accepted_data.php';
  static const getApproveData =
      '$_baseUrl/delivery/orders/get_approved_data.php';
      static const accept =
      '$_baseUrl/delivery/orders/received.php';
  static const approve =
      '$_baseUrl/delivery/orders/approval.php';
       static const getOrderDetails =
      '$_baseUrl/delivery/orders/order_details.php';
  static const getCities = '$_baseUrl/address/get_cities.php';

}
