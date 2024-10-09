import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/firebase_options.dart';
import 'core/managers/shared_perference_manager.dart';
import 'core/navigation/app_route.dart';
import 'core/navigation/routes.dart';

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
        initialRoute: Routes.payment,
        onGenerateRoute: AppRoute.getRoute ,
      ),
    ),
  );
}
