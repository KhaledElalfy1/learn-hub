import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/string_manager.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:learnhub/core/widgets/custom_primary_elevated_btn.dart';
import 'package:learnhub/core/widgets/custom_secondary_elevated_btn.dart';

class CustomAuthBtnsComponent extends StatelessWidget {
  final BuildContext context;
  const CustomAuthBtnsComponent({super.key, required this.context});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        CustomPrimaryElevatedBtn(
            onPressed:signUpBtnOnPressedFunc ,
            buttonTxt: StringManager.onboardingScreensignUpTxt,
            btnWidth: 0.4.sw),

        CustomSecondaryElevatedBtn(
            onPressed: signInBtnOnPressedFunc,
            buttonTxt: StringManager.onboardingScreensignInTxt,
            btnWidth: 0.4.sw )
      ],
    );
  }

void signUpBtnOnPressedFunc(){
 context.replaceScreen(Routes.register); 
}

void signInBtnOnPressedFunc(){
 context.replaceScreen(Routes.login); 
}

}


