import '../../constants/colors_manager.dart';
import '../../constants/route_manager.dart';
import '../../functions/navigation/to_named.dart';
import '../models/order_model/order_data.dart';
import '../../../features/accept/presentations/view_model/cubit/accept_cubit.dart';
import '../../../features/approval/presentations/view_model/cubit/approval_cubit.dart';
import '../../../features/order_details/presentation/view_data/cubit/order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomOrderItem extends StatelessWidget {
  CustomOrderItem({super.key, required this.orderData});
  OrderData orderData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #${orderData.orderId}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20.sp, height: 1),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: .5,
              color: ColorsManager.black.withOpacity(.4),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'SubPrice: ${orderData.orderSubprice} \$',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Text(
              'Delivery Price: ${orderData.orderDeliveryprice} \$',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Text(
              'Payment Method: ${orderData.orderPaymentmethod}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            if (orderData.orderStatus == '2' || orderData.orderStatus == '3')
              InkWell(
                onTap: () async {
                  if (orderData.orderStatus == '2') {
                    await ApprovalCubit.get(context).approveOrder(
                        orderData.orderId!, orderData.orderUserid!);
                  } else if (orderData.orderStatus == '3') {
                    await AcceptCubit.get(context).acceptOrder(
                        orderData.orderId!, orderData.orderUserid!);
                  }
                },
                child: Container(
                  width: 75.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: orderData.orderStatus == '2'
                        ? ColorsManager.blue
                        : ColorsManager.green,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          orderData.orderStatus == '3' ? 'Received' : 'Approve',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 13.sp,
                                    color: ColorsManager.black,
                                  ),
                        ),
                      ]),
                ),
              ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () async {
                OrderDetailsCubit.get(context)
                    .getOrderDetails(
                  context,
                  orderData.orderId!,
                )
                    .then((value) {
                  OrderDetailsCubit.get(context).getCities();
                  toNamed(context, RouteManager.orderDetails);
                });
              },
              child: Container(
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  color: ColorsManager.black,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Total Price: ${orderData.orderTotalprice}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorsManager.white,
                          ),
                    ),
                    const Spacer(),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: ColorsManager.primary,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorsManager.white,
                                      fontSize: 15.sp),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
