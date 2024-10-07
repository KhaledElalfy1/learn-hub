
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/managers/asset_manager.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/managers/size_manager.dart';
class HomeSliderUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],

        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                    items: const [
                      Content(content: true,
                        image:
                        // ImageAssets.courseCover
                        SvgAssets.sliderImage1,
                        padding: 150,
                      ),
                      Content(content: false,
                        image:

                        SvgAssets.sliderImage2,
                        padding: 40,
                      ),

                    ]
                  )),

            ],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final double padding;
  final image;
  final bool content;
  const Content({super.key, this.image, required this.content, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorManager.lightGreen,

          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      // height: MediaQuery.of(context).size.width / 2 ,
      width: 400,

      child: Padding(
        padding: const EdgeInsets.only(top: 32.0,left: 16.0),
        child: Stack(
          fit: StackFit.loose,
          children:[
            Padding(
              padding: EdgeInsets.only(left: padding),
              child: Container(

                height: 170,
                width: 200,

                child:
                // Image.asset(image)
                SvgPicture.asset(image) ,
              ),
            ),
            content?

                    Text("What do you want to learn todo",
                        style: TextStyle(
                            fontSize: SizeManager.s24,
                            fontWeight: FontWeight.bold
                        )
                    ):Text(""),
            content?
            Padding(
                      padding:  EdgeInsets.only(top: 100.0),
                      child: MaterialButton(onPressed: (){},

                          color: ColorManager.lightOrange
                          ,
                          child: Text("Get Started",
                            style: TextStyle(
                                fontSize: SizeManager.s18
                                ,fontWeight: FontWeight.bold
                                ,color: ColorManager.white
                            ),)),
                    )
                  : Text("")

          ],
        ),
      ),

    );
  }
}














