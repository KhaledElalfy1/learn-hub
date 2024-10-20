import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../courses/presentation/view_model/chosen_courses_cubit/chosen_courses_cubit.dart';
import '../../../courses/presentation/view_model/chosen_courses_cubit/chosen_courses_state.dart';
import '../components/course_details_bottom_navigation_bar.dart';
import '../components/course_details_main_container.dart';
import '../components/course_details_top_area.dart';
import '../components/play_video.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required CourseModel courseModel});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool isVideo = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightPink,
      body: BlocBuilder<ChosenCoursesCubit, ChosenCoursesState>(
        builder: (context, state) {
          if (state is ChosenCoursesSelected) {
            // الحصول على أول كورس مختار
            final course = state.courses.first;

            return Column(
              children: [
                Stack(
                  children: [
                    isVideo
                        ? const PlayVideo()
                        : CourseDetailsTopArea(
                      courseName: course.title, // تعيين الـ title هنا
                    )
                  ],
                ),
                const CourseDetailsMainContainer()
              ],
            );
          }
          return const CircularProgressIndicator(); // عرض مؤشر تحميل
        },
      ),
      bottomNavigationBar: const CourseDetailsBottomNavigationBar(),
    );
  }
}
