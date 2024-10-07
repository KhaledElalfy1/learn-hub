


import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';

import '../../../core/widgets/custom_circle_avatar.dart';

class HomeGreetingMessageUi extends StatefulWidget {
  const HomeGreetingMessageUi({super.key});

  @override
  State<HomeGreetingMessageUi> createState() => _home_greeting_message_uiState();
}

class _home_greeting_message_uiState extends State<HomeGreetingMessageUi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width:double.infinity ,
          height: MediaQuery.of(context).size.width / 2 ,
          color:ColorManager.blue ,
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0,left: 28.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi, Kristin",
                  style: TextStyle(
                    fontSize: SizeManager.s28,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.white
                  ),),
                  Text("Let's start learning",
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: SizeManager.s16

                  ),)
                ],
              ),
              Container(
                width: 80,
                height: 80,
                child: CustomCircleAvatar(
                    circleAvatarBackgroundColor: ColorManager.blue,
                    iconButtonOnPressed: (){},
                            icon: Image.asset(ImageAssets.accountProfile),
                ),
              )
              ]
              ,

            ),
          ),
        ),
      ),
    );
  }
}
