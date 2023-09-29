import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../../../../core/class/custom_divider.dart';
import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../widgets/custom_address_part_order_details.dart';
import '../widgets/custom_appbar_order_details.dart';
import '../widgets/custom_order_summary_order_details.dart';
import '../widgets/custom_payment_method_order_details.dart';
import '../widgets/custom_phone_part_order_details.dart';
import '../widgets/custom_product_order_details.dart';
import '../../view_data/cubit/order_details_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      var cubit = OrderDetailsCubit.get(context);
      return ConditionalBuilder(
        condition: state is GetOrderDetailsLoading,
        builder: (context) => Center(
          child: Lottie.asset(
            LottieAssetsManager.loading,
            width: 300,
            height: 450,
          ),
        ),
        fallback: (context) => SafeArea(
          child: Scaffold(
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomAppbarOrderDetails(
                  onTap: () {
                    pop(context);
                  },
                  title: 'Order Details',
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Order ID: #${cubit.orderDetailsData!.orderDetails!.orderId}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Ordered on ${cubit.orderDetailsData!.orderDetails!.orderDatetime}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                customDivider(),
                CustomAddressPartOrderDetails(
                  orderDetails: cubit.orderDetailsData!.addressDetails!,
                ),
                customDivider(),
                CustomPhoneNumberPartOrderDetails(
                  phoneNumber: cubit
                      .orderDetailsData!.addressDetails!.addressPhoneNumber!,
                ),
                customDivider(),
              
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cubit.orderDetailsData!.productsDetails!.length,
                  itemBuilder: (context, index) =>
                      CustomProductItemOrderDetails(
                    orderDetailsData:
                        cubit.orderDetailsData!.productsDetails![index],
                    orderStatus:
                        cubit.orderDetailsData!.orderDetails!.orderStatus!,
                    orderID: cubit.orderDetailsData!.orderDetails!.orderId!,
                  ),
                ),
                customDivider(),
                CustomPaymentMethodOrderDetails(
                  paymentMethod:
                      cubit.orderDetailsData!.orderDetails!.orderPaymentmethod!,
                ),
                CustomOredrSummaryOrderDetails(
                  orderDetails: cubit.orderDetailsData!.orderDetails!,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
