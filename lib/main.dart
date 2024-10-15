import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/services/services_locator.dart';
import 'package:learnhub/firebase_options.dart';
import 'core/managers/shared_perference_manager.dart';
import 'core/navigation/app_route.dart';
import 'core/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  await SharedPreferencesManager.init();
  runApp(
    const ScreenUtilInit(
      designSize: Size(375, 812),
      child: LearnHub(),
    ),
  );
}

class LearnHub extends StatelessWidget {
  const LearnHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnHub',
      initialRoute: Routes.register,
      onGenerateRoute: AppRoute.getRoute,
    );
  }
}
