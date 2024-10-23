import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/my_courses/presentation/model_view/get_bought_courses_cubit/get_bought_courses_state.dart';

class GetBoughtCoursesCubit extends Cubit<GetBoughtCoursesState> {
  GetBoughtCoursesCubit() : super(GetBoughtCoursesInitial());
  static GetBoughtCoursesCubit get(context) => BlocProvider.of(context);
  Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
      .collection('BoughtCourses')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  List<CourseModel> boughtCourses = [];
  Future<void> getBoughtCourses() async {
    emit(GetBoughtCoursesLoading());
    try {
      final data = await FirebaseFirestore.instance
          .collection("BoughtCourses")
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (var course in data.docs) {
        boughtCourses.add(CourseModel.fromFirebase(course.data()));
      }
      emit(GetBoughtCoursesSuccess(boughtCourses: boughtCourses));
    } catch (e) {
      emit(GetBoughtCoursesFailure(e.toString()));
    }
  }
}
