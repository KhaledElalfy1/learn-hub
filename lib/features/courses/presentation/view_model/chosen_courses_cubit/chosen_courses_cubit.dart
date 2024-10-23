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
      url: 'https://seekicon.com/free-icon-download/flutter_2.png',
    ),
    CourseModel(
      title: 'Dart',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn Dart Programming Language',
      price: '150',
      duration: '20h',
      url: 'https://th.bing.com/th/id/OIP.E-vAAOK23nhQpKHhVw3QtAHaHa?rs=1&pid=ImgDetMain',
    ),
    CourseModel(
      title: 'React Native',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React Native to Build iOS & Android Apps',
      price: '100',
      duration: '40h',
      url: 'https://th.bing.com/th/id/R.4ae337a57d80cfe589528ac242d4fa74?rik=xmaQKUw5eT4uIw&pid=ImgRaw&r=0',
    ),
    CourseModel(
      title: 'React',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React to Build Web Apps',
      price: '120',
      duration: '40h',
      url: 'https://pluspng.com/img-png/react-logo-png-img-react-logo-png-react-js-logo-png-transparent-png-1142x1027.png',
    ),
    CourseModel(
      title: 'JavaScript',
      instructor: 'Jonas Schmedtmann',
      description: 'Master JavaScript with projects, challenges, and theory',
      price: '180',
      duration: '30h',
      url: 'https://th.bing.com/th/id/R.9bb5435973bd1224b1135bb8338318ee?rik=%2fRcqi6mUep7Xuw&pid=ImgRaw&r=0',
    ),
    CourseModel(
      title: 'Python',
      instructor: 'Jose Portilla',
      description: 'Complete Python Bootcamp: Go from zero to hero in Python 3',
      price: '200',
      duration: '25h',
      url: 'https://th.bing.com/th/id/R.5720e1188b6bce7cf47e986257dc92ed?rik=DSr99DhTziM76A&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fPython-PNG-Clipart.png&ehk=wxEWhMx424mtlR1pgfi78DRfsaYS7278ywQdPXo3gd8%3d&risl=&pid=ImgRaw&r=0',
    ),
  ],
  'Popular': [
    CourseModel(
      title: 'html',
      instructor: 'Elzero Web School',
      description: 'Learn HTML to Build Web Pages',
      price: '50',
      duration: '40h',
      url: 'https://cdn0.iconfinder.com/data/icons/social-network-7/50/22-1024.png',
    ),
    CourseModel(
      title: 'css',
      instructor: 'Elzero Web School',
      description: 'Learn CSS to Style Web Pages',
      price: '60',
      duration: '20h',
      url: 'https://cdn.freebiesupply.com/logos/large/2x/css3-logo-png-transparent.png',
    ),
    CourseModel(
      title: 'React Native',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React Native to Build iOS & Android Apps',
      price: 'Free',
      duration: '40h',
      url: 'https://th.bing.com/th/id/R.4ae337a57d80cfe589528ac242d4fa74?rik=xmaQKUw5eT4uIw&pid=ImgRaw&r=0',
    ),
    CourseModel(
      title: 'React',
      instructor: 'Maximilian Schwarzmüller',
      description: 'Learn React to Build Web Apps',
      price: 'Free',
      duration: '40h',
      url: 'https://pluspng.com/img-png/react-logo-png-img-react-logo-png-react-js-logo-png-transparent-png-1142x1027.png',
    ),
    CourseModel(
      title: 'Node.js',
      instructor: 'Andrew Mead',
      description: 'The Complete Node.js Developer Course (3rd Edition)',
      price: '250',
      duration: '35h',
      url: 'https://th.bing.com/th/id/OIP.CTvVfHEeovAx-0V5-dqVRwHaHa?rs=1&pid=ImgDetMain',
    ),
    CourseModel(
      title: 'Machine Learning',
      instructor: 'Andrew Ng',
      description: 'Stanford Machine Learning with practical applications',
      price: '300',
      duration: '60h',
      url: 'https://cdn-icons-png.flaticon.com/512/8345/8345929.png',
    ),
  ],
  'New': [
    CourseModel(
      title: 'Adobe XD',
      instructor: 'Ehab Faze',
      description: 'Learn Adobe XD to Design Web Pages',
      price: 'Free',
      duration: '40h',
      url: 'https://th.bing.com/th/id/OIP.1y7yxsNu8eDV7yHrJ0TziQHaE8?rs=1&pid=ImgDetMain',
    ),
    CourseModel(
      title: 'Figma',
      instructor: 'Ehab Faze',
      description: 'Learn Figma to Design Web Pages',
      price: 'Free',
      duration: '20h',
      url: 'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3236765/figma-icon-md.png',
    ),
    CourseModel(
      title: 'Photoshop',
      instructor: 'Ehab Faze',
      description: 'Learn Photoshop to Design Web Pages',
      price: 'Free',
      duration: '40h',
      url: 'https://th.bing.com/th/id/R.744192fbfe04699006ed7a64b642244f?rik=HYW%2fM7csQj49QQ&pid=ImgRaw&r=0',
    ),
    CourseModel(
      title: 'UI/UX Design',
      instructor: 'Daniel Scott',
      description: 'Adobe XD UI/UX Design essentials',
      price: '100',
      duration: '15h',
      url: 'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3236765/figma-icon-md.png',
    ),
    CourseModel(
      title: 'Blender 3D',
      instructor: 'CG Boost',
      description: 'Learn Blender for beginners with this complete tutorial',
      price: 'Free',
      duration: '25h',
      url: 'https://th.bing.com/th/id/R.50a78fb26d509301249a4ed8c87390a4?rik=b27urvqSJyRX3A&pid=ImgRaw&r=0',
    ),
    CourseModel(
      title: 'Kotlin',
      instructor: 'Smartherd Developers',
      description: 'Kotlin for Android development',
      price: '120',
      duration: '30h',
      url: 'https://th.bing.com/th/id/R.0f6a690b27200af9bdd1657708d20cf8?rik=5pG9qDCsRFUbWg&pid=ImgRaw&r=0',
    ),
  ],
};

  int selectedIndex = 0;

  void selectIndex(int index) {
    selectedIndex = index;
    emit(ChosenCoursesSelected(courses: courseChosenMap[courseChosen[selectedIndex]]));
  }
}
