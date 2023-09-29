import 'core/constants/route_manager.dart';
import 'features/auth/view/screens/login_screen.dart';
import 'features/layout/view/screens/applayout_screen.dart';
import 'features/order_details/presentation/view/screens/order_details_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  RouteManager.layout: (c) => const AppLayout(),
  RouteManager.login: (c) => const LoginScreen(),
  RouteManager.orderDetails: (c) => const OrderDetailsScreen(),
};
