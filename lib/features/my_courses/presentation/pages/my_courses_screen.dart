import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/course_card.dart';
import 'package:learnhub/features/my_courses/presentation/model_view/get_bought_courses_cubit/get_bought_courses_cubit.dart';

import '../../../../core/managers/color_manager.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  void initState() {
    GetBoughtCoursesCubit.get(context).getBoughtCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: StreamBuilder<QuerySnapshot>(
          stream: GetBoughtCoursesCubit.get(context).collectionStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                final courses = CourseModel.fromFirebase(data);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CourseCard(course: courses),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
