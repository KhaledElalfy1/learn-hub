import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/view/courses_view.dart';
import 'package:learnhub/features/my_courses/presentation/pages/my_courses_screen.dart';
import 'package:learnhub/features/search/presentation/pages/search_page.dart';
import 'package:learnhub/home/screen/welcome_screen.dart';
import 'package:learnhub/home/view_model/navigation_cubit/navigation_state.dart';
import '../../../features/profile/pages/account_page.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) =>
      BlocProvider.of<NavigationCubit>(context);
  int index = 0;
  List<Widget> screens = const [
    WelcomeScreen(),
    CoursesView(),
    SearchPage(),
    MyCoursesScreen(),
    AccountPage()
  ];

  void selectIndex(int index) {
    this.index = index;
    emit(NavigationSelected(index));
  }
}
