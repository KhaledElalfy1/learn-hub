import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/core/app/verified_success_ui.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/features/on_boarding/presentaion/pages/onboarding_page.dart';

import 'package:learnhub/features/payment/presentation/pages/payment_screen.dart';

import 'package:learnhub/features/courses/presentation/view/courses_view.dart';
import 'package:learnhub/features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_cubit.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_cubit.dart';

import 'package:learnhub/core/managers/color_manager.dart';

import 'package:learnhub/features/search/presentation/pages/search_page.dart';
import 'package:learnhub/features/signup/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';

import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/signup/presentation/pages/signup_screen.dart';

class AppRoute {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return _getScreen(const Scaffold());
      case Routes.onboarding:
        return _getScreen(const OnboardingPage());
      case Routes.login:
        return _getScreen(const LoginScreen());
      case Routes.register:
        return _getScreen(BlocProvider(
          create: (context) => SignUpCubit(),
          child: const SignupScreen(),
        ));
      case Routes.forgetPassword:
        return _getScreen(const Scaffold());
      case Routes.verifyOTP:
        return _getScreen(const Scaffold());
      case Routes.resetPassword:
        return _getScreen(const Scaffold());

      case Routes.home:
        return _getScreen(HomeScreen());
      case Routes.courses:
        return _getScreen(MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ChosenCoursesCubit()..selectIndex(0),
            ),
            BlocProvider(
              create: (context) => SearchBarCubit(),
            ),
          ],
          child: const CoursesView(),
        ));
      case Routes.search:
        return _getScreen(const Scaffold(
          backgroundColor: ColorManager.white,
          body: SearchPage(),
        ));
      case Routes.notification:
        return _getScreen(const Scaffold());
      case Routes.account:
        return _getScreen(const Scaffold());
      case Routes.courseDetails:
        return _getScreen(const Scaffold());
      case Routes.courseContent:
        return _getScreen(const Scaffold());
      case Routes.myCourses:
        return _getScreen(const Scaffold());
      case Routes.payment:
        return _getScreen(const PaymentScreen());
      case Routes.profile:
        return _getScreen(const Scaffold());
      case Routes.changePassword:
        return _getScreen(const Scaffold());

      default:
        return _getNotFoundScreen();
    }
  }

  static _getScreen(Widget child) => MaterialPageRoute(builder: (_) => child);

  static _getNotFoundScreen() => _getScreen(const Scaffold());
}
