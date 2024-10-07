import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/search/domain/entities/course_details_entity.dart';

import 'package:learnhub/features/search/presentation/cubit/search_courses_state.dart';

class SearchCoursesCubit extends Cubit<SearchCoursesState> {



  List<CourseDetailsEntity> courses = [
    const CourseDetailsEntity("PhotoShop", "Design", "Tahed",
        "190", "15 ", "courseImg"),
        const CourseDetailsEntity("Tomato", "Cook", "shrbeni",
        "190", "15 ", "courseImg"),
        const CourseDetailsEntity("eye", "Paint", "Nana",
        "190", "15 ", "courseImg"),
        const CourseDetailsEntity("c#", "Program", "Tahed",
        "190", "15 ", "courseImg"),
    const CourseDetailsEntity("C++", "Program", "Emad",
        "150", "5 ", "courseImg2")
  ];

  List<String> courseCategories = ["Design", "Program","Cook","Paint","carbenter"];

  SearchCoursesCubit() : super(InitialState(courses:[
    const CourseDetailsEntity("PhotoShop", "Design", "Tahed",
        "190", "15 ", "courseImg"),
        const CourseDetailsEntity("Tomato", "Cook", "shrbeni",
        "190", "15 ", "courseImg"),
        const CourseDetailsEntity("eye", "Paint", "Nana",
        "190", "15 ", "courseImg"),
        const CourseDetailsEntity("c#", "Program", "Tahed",
        "190", "15 ", "courseImg"),
    const CourseDetailsEntity("C++", "Program", "Emad",
        "150", "5 ", "courseImg2")
  ],courseCategories:["Design", "Program","Cook","Paint","carbenter"]));

  void searchBarOnChangeFunc({required String searchBarContentText}) {
    List<CourseDetailsEntity> result = [];

    if (searchBarContentText.isEmpty) {

      result= courses;

      emit(InitialState(courses: courses,courseCategories: courseCategories));
    } else {

      result = courses
          .where((element) => element.courseName
              .toLowerCase()
              .trim()
              .contains(searchBarContentText.toLowerCase().trim()))
          .toList();

      emit(ChangeContentOfSearchBarState(
          searchBarContentText: searchBarContentText, foundCourses: result,courseCategories: courseCategories));
    }
  }

  void filterCoursesBasedOnSelectedCategory({required String searchBarContentText,required String selectedCategory}){
    List<CourseDetailsEntity> result = [];
    
      result = courses
          .where((element) => element.courseCategory
              .toLowerCase()
              .trim()
              .contains(selectedCategory.toLowerCase().trim())&&
              element.courseName
              .toLowerCase()
              .trim()
              .contains(searchBarContentText.toLowerCase().trim() )
              )
          .toList();

      emit(ChangeContentOfSearchBarState(
           foundCourses: result,courseCategories: courseCategories, searchBarContentText: searchBarContentText));
  }
}
