// ignore_for_file: must_be_immutable
import 'package:deliveryapp/core/constants/colors_manager.dart';
import 'package:deliveryapp/features/order_details/data/models/order_details_model/address_data.dart';
import 'package:deliveryapp/features/order_details/presentation/view_data/cubit/order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressPartOrderDetails extends StatelessWidget {
  CustomAddressPartOrderDetails({super.key, required this.orderDetails});
  AddressData orderDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Shipping Address',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.pin_drop_outlined,
                color: ColorsManager.grey,
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width /1.5,
                child: Text(
                  maxLines: 10,
                  '${OrderDetailsCubit.get(context).getCityName(orderDetails.cityId!)}, ${orderDetails.addressStreet} , ${orderDetails.additionalDetails},',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.black.withOpacity(
                          .8,
                        ),
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                        height: 1.5,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
