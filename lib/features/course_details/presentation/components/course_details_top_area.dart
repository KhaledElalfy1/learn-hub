import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

import '../../../../core/managers/size_manager.dart';

class CourseDetailsTopArea extends StatelessWidget {
  const CourseDetailsTopArea({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: SizedBox(
              width: double.infinity,
              height: size.height * .3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(ImageAssets.courseCover2),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(

                                          image: AssetImage(ImageAssets.bestseller),
                                        )),
                                    child: Text(
                                      'Bestseller',
                                      style: StyleManager.descriptionPoppins(fontSize: 18,fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Course Name',
                                  style: StyleManager.mediumPoppins(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),


                    ],
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(ImageAssets.illustration),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ));
  }
}
