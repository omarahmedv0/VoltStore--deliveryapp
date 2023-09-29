import '../../../../../core/functions/init_app.dart';
import '../../../../../core/shared/models/order_model/order_model.dart';
import '../../../data/repo/received_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'received_state.dart';

class ReceivedCubit extends Cubit<ReceivedState> {
  ReceivedCubit(this.receivedRepoImpl) : super(ReceivedInitial());

  ReceivedRepoImpl receivedRepoImpl;
  static ReceivedCubit get(context) {
    return BlocProvider.of(context);
  }

  OrderModel orderModel = OrderModel();
  Future<void> getReceivedData() async {
    emit(GetReceivedDataLoading());
    var response = await receivedRepoImpl
        .getReceivedData(sharedPreferences.getString("deliveryID")!);
    response.fold((failure) {
      emit(GetReceivedDataFailere());
    }, (data) {
      orderModel = data;
      emit(GetReceivedDataSuccess());
    });
  }

 
}
