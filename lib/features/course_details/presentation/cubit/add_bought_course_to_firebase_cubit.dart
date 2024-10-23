import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/course_details/presentation/cubit/add_bought_course_to_firebase_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

class AddBoughtCourseToFirebaseCubit
    extends Cubit<AddBoughtCourseToFirebaseState> {
  AddBoughtCourseToFirebaseCubit() : super(AddBoughtCourseToFirebaseInitial());
  static AddBoughtCourseToFirebaseCubit get(context) =>
      BlocProvider.of(context);
  CollectionReference boughtCourses =
      FirebaseFirestore.instance.collection('BoughtCourses');
  Future addBoughtCourseToFirebase({required CourseModel courseModel}) async {
    emit(AddBoughtCourseToFirebaseLoading());
    try {
      await boughtCourses.add(courseModel.toMap());
      emit(AddBoughtCourseToFirebaseSuccess());
    } on Exception catch (e) {
      emit(AddBoughtCourseToFirebaseFailure(e.toString()));
    }
  }
}
