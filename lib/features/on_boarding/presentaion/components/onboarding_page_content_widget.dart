import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/string_manager.dart';
import 'package:learnhub/features/on_boarding/presentaion/components/custom_auth_btns_component.dart';
import 'package:learnhub/features/on_boarding/presentaion/components/custom_onboarding_component.dart';
import 'package:learnhub/features/on_boarding/presentaion/cubit/onboarding_cubit.dart';
import 'package:learnhub/features/on_boarding/presentaion/widgets/custom_indicator_widget.dart';

class OnboardingContentWidget extends StatelessWidget {

  final PageController pageViewController;

  const OnboardingContentWidget(
      {super.key, required this.pageViewController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child:
          BlocBuilder<OnboardingCubit, int>(builder: (_, index) {

        final lastPageCondition = index == 2;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            SizedBox(
              height: 0.65.sh,
              child: PageView( 

                controller: pageViewController,
                onPageChanged: (pageIndex)=>context.read<OnboardingCubit>().pagedIndex(pageIndex),
                children: [

                  CustomOnboardingComponent(
                    imagePath: "assets/svg/onboarding1.svg",
                    titleTxt: StringManager.onboarding1TitleTxt,
                    descriptionTxt: StringManager.onboarding1DescriptionTxt,
                  ),

                  CustomOnboardingComponent(
                    imagePath: "assets/svg/onboarding2.svg",
                    titleTxt: StringManager.onboarding2TitleTxt,
                    descriptionTxt: StringManager.onboarding2DescriptionTxt,
                  ),
                  
                  CustomOnboardingComponent(
                    imagePath: "assets/svg/onboarding3.svg",
                    titleTxt: StringManager.onboarding3TitleTxt,
                    descriptionTxt: StringManager.onboarding3DescriptionTxt,
                  ),

                ],
              ),
            ),

            CustomIndicatorwidget(pageViewController: pageViewController),

            lastPageCondition
                ? CustomAuthBtnsComponent(
                    context: context,
                  )
                : const SizedBox(),
          ],
        );
      }),
    );
  }
}
