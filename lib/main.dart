import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/firebase_options.dart';
import 'package:learnhub/home/presentation/components/home_get_started_ui.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const HomeGetStartedUi());
}


