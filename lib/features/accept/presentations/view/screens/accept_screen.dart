import 'package:deliveryapp/core/constants/route_manager.dart';
import 'package:deliveryapp/core/functions/init_app.dart';
import 'package:deliveryapp/core/functions/navigation/to_named_and_remove_until.dart';
import 'package:deliveryapp/core/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/shared/widgets/custom_order_item.dart';
import '../../../../approval/presentations/view_model/cubit/approval_cubit.dart';
import '../../../../received/presentations/view_model/cubit/received_cubit.dart';
import '../../view_model/cubit/accept_cubit.dart';

class AcceptScreen extends StatelessWidget {
  const AcceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcceptCubit, AcceptState>(
      builder: (context, state) {
        var cubit = AcceptCubit.get(context);
        return Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 15.h,
              ),
              CustomAppBar(
                title: 'UnReceived',
                ispadding: true,
                logout: true,
                onTap: () {
                  sharedPreferences.clear();
                  toNamedandRemoveUntil(
                    context,
                    RouteManager.login,
                  );
                },
              ),
              HandlingStateView(
                  conditionEmpty: cubit.orderModel.orderData.isEmpty,
                  conditionError: state is GetAcceptDataFailere,
                  conditionLoading: state is GetApproveDataLoading ||
                      state is GetAcceptDataLoading ||
                      state is GetReceivedDataLoading,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.orderModel.orderData.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomOrderItem(
                        orderData: cubit.orderModel.orderData[index],
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
