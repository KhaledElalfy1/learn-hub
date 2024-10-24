import 'package:flutter/material.dart';
import 'package:learnhub/home/components/course_progress_widget.dart';
import 'package:learnhub/home/components/courses_offers_widget.dart';
import 'package:learnhub/home/components/user_info_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: UserInfoWidget(),
            ),
            Expanded(
              flex: 3,
              child: CoursesOffersWidget(),
            ),
          ],
        ),
        Positioned(top: 100, child: CourseProgressWidget()),
      ],
    );
  }
}
