import 'package:firebase_auth/firebase_auth.dart';

class CourseModel {
  final String title;
  final String instructor;
  final String description;
  final String price;
  final String duration;
  final String url;

  CourseModel(
      {required this.title,
      required this.instructor,
      required this.description,
      required this.price,
      required this.duration,
      required this.url});
  factory CourseModel.fromFirebase(Map<String, dynamic> map) {
    return CourseModel(
      title: map['title'],
      instructor: map['instructor'],
      description: map['description'],
      price: map['price'],
      duration: map['duration'],
      url: map['url'],
    );
  }
  toMap() {
    return {
      'title': title,
      'instructor': instructor,
      'description': description,
      'price': price,
      'duration': duration,
      'url': url,
      'userId': FirebaseAuth.instance.currentUser!.uid
    };
  }
}
