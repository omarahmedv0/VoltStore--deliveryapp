import '../../../../../core/functions/init_app.dart';
import '../../../../../core/shared/models/order_model/order_model.dart';
import '../../../data/repo/approve_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'approval_state.dart';

class ApprovalCubit extends Cubit<ApprovalState> {
  ApprovalCubit(this.approveRepoImpl) : super(ApprovalInitial());
  static ApprovalCubit get(context) {
    return BlocProvider.of(context);
  }

  ApproveRepoImpl approveRepoImpl;
  OrderModel orderModel = OrderModel();

  getApproveData() async {
    emit(GetApproveDataLoading());
    var response = await approveRepoImpl
        .getApproveData(sharedPreferences.getString("deliveryID")!);
    response.fold((failure) {
      emit(GetApproveDataFailere());
    }, (data) {
      orderModel = data;
      emit(GetApproveDataSuccess());
    });
  }

 Future<void> approveOrder(String orderID, String userID) async {
    emit(ApproveOrderLoading());
    var response = await approveRepoImpl.approveOrder(orderID, userID);
    response.fold((failure) {
      emit(ApproveOrderFailere());
    }, (data) {
      getApproveData();
      orderModel = data;
      emit(ApproveOrderSuccess());
    });
  }
 
}
