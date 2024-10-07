import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/size_manager.dart';

import '../../../../core/managers/color_manager.dart';
import '../components/card_header.dart';
import '../components/course_item.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});
  List<Course> generateDummyCourses() {
    return [
      Course(
        title: 'Introduction to Flutter',
        date: '09/24',
        progress: 0.1,
      ),
      Course(
        title: 'Version Control with Git',
        date: '08/24',
        progress: 0.2,
      ),
      Course(
        title: 'UI/UX Design Principles',
        date: '07/24',
        progress: 0.3,
      ),
      Course(
        title: 'Cloud Computing Basics',
        date: '06/24',
        progress: 0.4,
      ),
      Course(
        title: 'Firebase Integration',
        date: '05/24',
        progress: 0.5,
      ),
      Course(
        title: 'Building Responsive Apps',
        date: '04/24',
        progress: 0.6,
      ),
      Course(
        title: 'Testing in Flutter',
        date: '03/24',
        progress: 0.7,
      ),
      Course(
        title: 'Animations in Flutter',
        date: '02/24',
        progress: 0.8,
      ),
      Course(
        title: 'Networking with APIs',
        date: '01/24',
        progress: 0.9,
      ),
      Course(
        title: 'Deploying Flutter Apps',
        date: '12/23',
        progress: 1.0,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('My Courses'),
      ),
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          const CardHeader(),
          SizeManager.s20.verticalSpace,
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: SizeManager.s16.w),
              itemBuilder: (context, index) =>  CourseItem(index: index,course: generateDummyCourses()[index],),
              itemCount: 10,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 223.h,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 14.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Course {
  final String title;
  final String date;
  final double progress; // Progress ratio between 0 and 1

  Course({required this.title, required this.date, required this.progress});
}

