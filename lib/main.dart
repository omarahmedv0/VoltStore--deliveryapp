import 'features/accept/data/repo/accept_repo_impl.dart';
import 'features/accept/presentations/view_model/cubit/accept_cubit.dart';
import 'features/approval/data/repo/approve_repo_impl.dart';
import 'features/approval/presentations/view_model/cubit/approval_cubit.dart';
import 'features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'features/auth/view_model/login_cubit/login_cubit.dart';
import 'features/layout/view_model/cubit/app_layout_cubit.dart';
import 'features/order_details/data/repo/order_details_repo_impl.dart';
import 'features/order_details/presentation/view_data/cubit/order_details_cubit.dart';
import 'features/received/data/repo/received_repo_impl.dart';
import 'features/received/presentations/view_model/cubit/received_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/functions/init_app.dart';
import 'core/functions/initial_route.dart';
import 'core/functions/language/initial_language.dart';

import 'injections.dart';
import 'routes.dart';
import 'themes/theme_manager.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  initialInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>AppLayoutCubit(),
            ),
             BlocProvider(
              create: (context) => ApprovalCubit(getIt.get<ApproveRepoImpl>())..getApproveData(),
            ),
              BlocProvider(
              create: (context) => ReceivedCubit(getIt.get<ReceivedRepoImpl>())..getReceivedData(),
            ),
              BlocProvider(
              create: (context) => AcceptCubit(getIt.get<AcceptRepoImpl>())..getAcceptData(),
            ),
             BlocProvider(
              create: (context) => OrderDetailsCubit(getIt.get<OrderDetailsRepoImpl>()),
            ),
          ],
          child: MaterialApp(
            initialRoute: initialRoute(),
            routes: routes,
            locale: language,
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.englishTheme,
          ),
        );
      },
    );
  }
}
