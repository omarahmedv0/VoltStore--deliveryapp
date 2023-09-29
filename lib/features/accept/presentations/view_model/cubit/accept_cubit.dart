import '../../../../../core/functions/init_app.dart';
import '../../../../../core/shared/models/order_model/order_model.dart';
import '../../../data/repo/accept_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'accept_state.dart';

class AcceptCubit extends Cubit<AcceptState> {
  AcceptCubit(this.acceptRepoImpl) : super(AcceptInitial());
  AcceptRepoImpl acceptRepoImpl;
  static AcceptCubit get(context) {
    return BlocProvider.of(context);
  }

  OrderModel orderModel = OrderModel();
   Future<void> getAcceptData() async {
    emit(GetAcceptDataLoading());
    var response = await acceptRepoImpl
        .getAcceptData(sharedPreferences.getString("deliveryID")!);
    response.fold((failure) {
      emit(GetAcceptDataFailere());
    }, (data) {
      orderModel = data;
      emit(GetAcceptDataSuccess());
    });
  }

  Future<void> acceptOrder(String orderID, String userID,) async {
    emit(AcceptOrderLoading());
    var response = await acceptRepoImpl.acceptOrder(orderID, userID);
    response.fold((failure) {
      emit(AcceptOrderFailere());
    }, (data) {
      getAcceptData();
      orderModel = data;
      emit(AcceptOrderSuccess());
    });
  }
}

