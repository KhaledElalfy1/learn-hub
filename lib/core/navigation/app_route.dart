import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/core/services/services_locator.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/home/components/slider_widget.dart';
import 'package:learnhub/features/on_boarding/presentaion/pages/onboarding_page.dart';

import 'package:learnhub/features/payment/presentation/pages/payment_screen.dart';
import 'package:learnhub/features/courses/presentation/view/courses_view.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/features/search/presentation/pages/search_page.dart';
import 'package:learnhub/features/signup/data/repo/sign_up_repo.dart';
import 'package:learnhub/features/signup/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';

import 'package:learnhub/home/screen/home_screen.dart';
import 'package:learnhub/home/view_model/navigation_cubit/navigation_cubit.dart';

import '../../features/course_details/presentation/pages/course_details_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/signup/presentation/pages/signup_screen.dart';

class AppRoute {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    final argument = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.splash:
        return _getScreen(const Scaffold());
      case Routes.onboarding:
        return _getScreen(const OnboardingPage());
      case Routes.login:
        return _getScreen(const LoginScreen());
      case Routes.login:
        return _getScreen(const LoginScreen());
      case Routes.register:
        return _getScreen(BlocProvider(
          create: (context) => SignUpCubit(getIt<SignUpRepo>()),
          child: const SignupScreen(),
        ));
      case Routes.forgetPassword:
        return _getScreen(const Scaffold());
      case Routes.verifyOTP:
        return _getScreen(const Scaffold());
      case Routes.homeGetStartedUi:
        return _getScreen(const SliderWidget());
      case Routes.resetPassword:
        return _getScreen(const Scaffold());
      case Routes.home:
        return _getScreen(BlocProvider(
          create: (context) => NavigationCubit(),
          child: const HomeScreen(),
        ));
      case Routes.courses:
        return _getScreen(
          const CoursesView(),
        );
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
        return _getScreen( CourseDetailsScreen(courseModel: argument as CourseModel,));
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
