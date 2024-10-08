import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';

import '../../../../core/managers/size_manager.dart';
import '../components/header_section.dart';
import '../components/login_section.dart';
import '../components/signup_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.greyGrey,
      body: SizedBox(
        width: 1.sw,
        height: double.infinity,
        child:  Column(
          children: [
            const HeaderSection(title: 'Login',),
            // HeaderSection(title: 'Sign Up',description: 'Enter your details below & free sign up',),
            Expanded(
              child: Container(
                width: 1.sw,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(SizeManager.s32.r),
                    )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      LoginSection(),
                      SizeManager.s24.verticalSpace,
                  
                      const SignupSection(),
                    ],
                  ),
                ),


              ),
            ),

          ],
        ),
      ),
    );
  }
}
