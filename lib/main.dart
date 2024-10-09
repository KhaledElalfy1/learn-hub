import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/firebase_options.dart';
import 'package:learnhub/home/presentation/components/home_get_started_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/managers/shared_perference_manager.dart';
import 'core/navigation/app_route.dart';
import 'core/navigation/routes.dart';
import 'features/on_boarding/presentaion/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesManager.init();
  runApp(
    const ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        title: 'LearnHub',
        initialRoute: Routes.courses,
        onGenerateRoute: AppRoute.getRoute ,
      ),
    ),
  );
}
