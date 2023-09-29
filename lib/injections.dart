// ignore_for_file: depend_on_referenced_packages

import 'package:deliveryapp/features/accept/data/repo/accept_repo_impl.dart';
import 'package:deliveryapp/features/approval/data/repo/approve_repo_impl.dart';
import 'package:deliveryapp/features/order_details/data/repo/order_details_repo_impl.dart';
import 'package:deliveryapp/features/received/data/repo/received_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'core/class/api/api_service.dart';
import 'features/auth/data/repos/login_repo/login_repo_impl.dart';

final getIt = GetIt.instance;

void initialInjections() {
// Networking
  getIt.registerSingleton<Client>(Client());

  // API Services
  getIt.registerSingleton<ApiService>(ApiService(
    http: getIt.get<Client>(),
  ));

  // Repos
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
   getIt.registerSingleton<ApproveRepoImpl>(ApproveRepoImpl(
    apiService:  getIt.get<ApiService>(),
  ));
    getIt.registerSingleton<ReceivedRepoImpl>(ReceivedRepoImpl(
    apiService:  getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<AcceptRepoImpl>(AcceptRepoImpl(
    apiService:  getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<OrderDetailsRepoImpl>(OrderDetailsRepoImpl(
    apiService:  getIt.get<ApiService>(),
  ));
}
