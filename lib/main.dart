import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/core/services/services_locator.dart';
import 'package:learnhub/features/course_details/presentation/cubit/add_bought_course_to_firebase_cubit.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_cubit.dart';
import 'package:learnhub/features/login/presentation/cubit/log_out_cubit.dart';
import 'package:learnhub/features/login/presentation/cubit/login_cubit.dart';
import 'package:learnhub/firebase_options.dart';
import 'core/managers/shared_perference_manager.dart';
import 'core/navigation/app_route.dart';
import 'features/course_details/presentation/cubit/play_video_cubit.dart';
import 'features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_cubit.dart';
import 'features/login/presentation/cubit/edit_account_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  await SharedPreferencesManager.init();
  await dotenv.load(fileName: ".env");
  runApp(const LearnHub());
}

class LearnHub extends StatelessWidget {
  const LearnHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => AddBoughtCourseToFirebaseCubit()),
        BlocProvider(create: (context) => LogOutCubit()),
        BlocProvider(create: (context) => SearchBarCubit()),
        BlocProvider(create: (context) => PlayVideoCubit()),
        BlocProvider(create: (context) => EditAccountCubit()),
        BlocProvider(
          create: (context) => ChosenCoursesCubit()..selectIndex(0),
        ),
      ],
      child: const ScreenUtilInit(
        designSize: Size(375, 812),
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
/**
 * 
 * sb-ujw47333493673@personal.example.com
 *  6bT0/Aru
 */