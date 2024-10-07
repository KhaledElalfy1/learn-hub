import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/features/signup/presentation/components/footer_section.dart';
import 'package:learnhub/features/signup/presentation/components/register_section.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../login/presentation/components/header_section.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.greyGrey,
      body: SizedBox(
        width: 1.sw,
        child:  Column(
          children: [
            const HeaderSection(title: 'Sign Up',description: 'Enter your details below & free sign up',),
            Expanded(
              child: Container(
                width: 1.sw,
                padding:  EdgeInsets.symmetric(horizontal: SizeManager.s24.w,vertical: SizeManager.s32),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(SizeManager.s12.r),
                    )
                ),
                child: Column(
                  children: [
                    RegisterSection(),
                    SizeManager.s24.verticalSpace,

                     const FooterSection(),
                  ],
                ),


              ),
            ),

          ],
        ),
      ),
    );
  }
}
