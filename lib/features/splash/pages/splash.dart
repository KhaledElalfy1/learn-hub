import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/core/navigation/routes.dart';

import '../../../core/managers/shared_perference_manager.dart';
import '../../../core/managers/string_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Image.asset(
            ImageAssets.splash,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (FirebaseAuth.instance.currentUser != null) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    } else if (SharedPreferencesManager.getData(
        key: StringManager.onBoarding)) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.onboarding);
      }
    }
  }
}
