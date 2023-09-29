import '../../../accept/presentations/view/screens/accept_screen.dart';
import '../../../accept/presentations/view_model/cubit/accept_cubit.dart';
import '../../../approval/presentations/view/screens/approval_screen.dart';
import '../../../received/presentations/view/screens/received_screen.dart';
import '../../../received/presentations/view_model/cubit/received_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutInitial());
  static AppLayoutCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Widget> listPages = [
    const ApprovalScreen(),
    BlocBuilder<AcceptCubit, AcceptState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        AcceptCubit.get(context).getAcceptData();

        return const AcceptScreen();
      },
    ),
    BlocBuilder<ReceivedCubit, ReceivedState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        ReceivedCubit.get(context).getReceivedData();
        return const ReceivedScreen();
      },
    ),
  ];
  List<IconData> iconPages = [
    Icons.inventory_2_outlined,
    Icons.local_shipping_outlined,
    Icons.check_circle_outline,
  ];
  int currentPage = 0;
  changeCurrentPage(int index) {
    currentPage = index;
    emit(ChangeCurrentpage());
  }
}
