import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learnhub/features/on_boarding/presentaion/cubit/onboarding_cubit.dart';
import 'package:learnhub/features/on_boarding/presentaion/components/onboarding_page_content_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
   late PageController _pageViewController;
  
  @override
  void initState() {
    _pageViewController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(),
          child: OnboardingContentWidget(
              pageViewController: _pageViewController),
        ),
      );

  }
}
