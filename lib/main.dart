import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/string_manager.dart';
import 'package:learnhub/core/services/services_locator.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_cubit.dart';
import 'package:learnhub/features/login/presentation/cubit/log_out_cubit.dart';
import 'package:learnhub/features/login/presentation/cubit/login_cubit.dart';
import 'package:learnhub/features/splash/pages/splash.dart';
import 'package:learnhub/firebase_options.dart';
import 'core/managers/shared_perference_manager.dart';
import 'core/navigation/app_route.dart';
import 'core/navigation/routes.dart';

import 'features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  await SharedPreferencesManager.init();
  runApp(const LearnHub());
}

class LearnHub extends StatelessWidget {
  const LearnHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => LogOutCubit()),
        BlocProvider(create: (context) => SearchBarCubit()),
        BlocProvider(
          create: (context) => ChosenCoursesCubit()..selectIndex(0),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LearnHub',
          initialRoute: Routes.splash,
          onGenerateRoute: AppRoute.getRoute,
        ),
      ),
    );
  }

  
}
