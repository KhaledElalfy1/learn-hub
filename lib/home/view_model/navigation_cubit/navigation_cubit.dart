import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/view/courses_view.dart';
import 'package:learnhub/features/my_courses/presentation/model_view/get_bought_courses_cubit/get_bought_courses_cubit.dart';
import 'package:learnhub/features/my_courses/presentation/pages/my_courses_screen.dart';
import 'package:learnhub/features/profile/presentation/controller/update_name_cubit/update_name_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/update_new_image_cubit/update_new_image_cubit.dart';
import 'package:learnhub/features/profile/presentation/view/profile.dart';
import 'package:learnhub/features/search/presentation/pages/search_page.dart';
import 'package:learnhub/home/screen/welcome_screen.dart';
import 'package:learnhub/home/view_model/navigation_cubit/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) =>
      BlocProvider.of<NavigationCubit>(context);
  int index = 0;
  List<Widget> screens = [
    const WelcomeScreen(),
    const CoursesView(),
    const SearchPage(),
    BlocProvider(
      create: (context) => GetBoughtCoursesCubit()..getBoughtCourses(),
      child: const MyCoursesScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateNameCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateNewImageCubit(),
        ),
      ],
      child: const Profile(),
    )
  ];

  void selectIndex(int index) {
    this.index = index;
    emit(NavigationSelected(index));
  }
}
