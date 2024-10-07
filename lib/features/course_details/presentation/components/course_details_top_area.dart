import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

import '../../../../core/managers/size_manager.dart';

class CourseDetailsTopArea extends StatelessWidget {
  const CourseDetailsTopArea({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(vertical:SizeManager.s8,horizontal: SizeManager.s16),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:  AssetImage(ImageAssets.bestseller),
                  )
                ),
                child: Text('Bestseller',style: StyleManager.descriptionPoppins(),),
              ),
            ),
            Image.asset(ImageAssets.courseCover2),
          ],),
          Image.asset(ImageAssets.courseCover),
      
        ],
      ),
    );
  }
}
