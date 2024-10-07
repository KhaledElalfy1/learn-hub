import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_state.dart';

class ChosenCoursesCubit extends Cubit<ChosenCoursesState> {
  ChosenCoursesCubit() : super(ChosenCoursesInitial());
  static ChosenCoursesCubit get(context) => BlocProvider.of(context);
  final List<String> courseChosen = const ['All', 'Popular', 'New'];
  Map<String, dynamic> courseChosenMap = {
  'All': [
    CourseModel(
      title: 'Flutter',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn Flutter & Dart to Build iOS & Android Apps',
      price: 'Free',
      duration: '40h',
    ),
    CourseModel(
      title: 'Dart',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn Dart Programming Language',
      price: '150',
      duration: '20h',
    ),
    CourseModel(
      title: 'React Native',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React Native to Build iOS & Android Apps',
      price: '100',
      duration: '40h',
    ),
    CourseModel(
      title: 'React',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React to Build Web Apps',
      price: '120',
      duration: '40h',
    ),
    CourseModel(
      title: 'JavaScript',
      instructor: 'Jonas Schmedtmann',
      description: 'Master JavaScript with projects, challenges, and theory',
      price: '180',
      duration: '30h',
    ),
    CourseModel(
      title: 'Python',
      instructor: 'Jose Portilla',
      description: 'Complete Python Bootcamp: Go from zero to hero in Python 3',
      price: '200',
      duration: '25h',
    ),
  ],
  'Popular': [
    CourseModel(
      title: 'html',
      instructor: 'Elzero Web School',
      description: 'Learn HTML to Build Web Pages',
      price: '50',
      duration: '40h',
    ),
    CourseModel(
      title: 'css',
      instructor: 'Elzero Web School',
      description: 'Learn CSS to Style Web Pages',
      price: '60',
      duration: '20h',
    ),
    CourseModel(
      title: 'React Native',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React Native to Build iOS & Android Apps',
      price: 'Free',
      duration: '40h',
    ),
    CourseModel(
      title: 'React',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React to Build Web Apps',
      price: 'Free',
      duration: '40h',
    ),
    CourseModel(
      title: 'Node.js',
      instructor: 'Andrew Mead',
      description: 'The Complete Node.js Developer Course (3rd Edition)',
      price: '250',
      duration: '35h',
    ),
    CourseModel(
      title: 'Machine Learning',
      instructor: 'Andrew Ng',
      description: 'Stanford Machine Learning with practical applications',
      price: '300',
      duration: '60h',
    ),
  ],
  'New': [
    CourseModel(
      title: 'Adobe XD',
      instructor: 'Ehab Faze',
      description: 'Learn Adobe XD to Design Web Pages',
      price: 'Free',
      duration: '40h',
    ),
    CourseModel(
      title: 'Figma',
      instructor: 'Ehab Faze',
      description: 'Learn Figma to Design Web Pages',
      price: 'Free',
      duration: '20h',
    ),
    CourseModel(
      title: 'Photoshop',
      instructor: 'Ehab Faze',
      description: 'Learn Photoshop to Design Web Pages',
      price: 'Free',
      duration: '40h',
    ),
    CourseModel(
      title: 'UI/UX Design',
      instructor: 'Daniel Scott',
      description: 'Adobe XD UI/UX Design essentials',
      price: '100',
      duration: '15h',
    ),
    CourseModel(
      title: 'Blender 3D',
      instructor: 'CG Boost',
      description: 'Learn Blender for beginners with this complete tutorial',
      price: 'Free',
      duration: '25h',
    ),
    CourseModel(
      title: 'Kotlin',
      instructor: 'Smartherd Developers',
      description: 'Kotlin for Android development',
      price: '120',
      duration: '30h',
    ),
  ],
};

  int selectedIndex = 0;

  void selectIndex(int index) {
    selectedIndex = index;
    emit(ChosenCoursesSelected(courses: courseChosenMap[courseChosen[selectedIndex]]));
  }
}
