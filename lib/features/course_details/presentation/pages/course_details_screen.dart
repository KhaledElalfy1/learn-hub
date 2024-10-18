import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:learnhub/features/course_details/presentation/components/course_details_bottom_navigation_bar.dart';
import 'package:learnhub/features/course_details/presentation/components/course_details_main_container.dart';
import 'package:learnhub/features/course_details/presentation/components/course_details_top_area.dart';
import 'package:learnhub/features/course_details/presentation/components/play_video.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/clocking_in_dialog.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
 @override
  void initState() {

   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.lightPink,

      body: Column(
        children: [
          CourseDetailsTopArea(),
          PlayVideo(),
          CourseDetailsMainContainer()
        ],
      ),
      bottomNavigationBar: CourseDetailsBottomNavigationBar(),
    );
  }
}
