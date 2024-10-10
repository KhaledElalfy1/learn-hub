import 'package:flutter/material.dart';

import '../../../core/managers/asset_manager.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/managers/size_manager.dart';

class MeetUp extends StatelessWidget {
  const MeetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(
          color: Color(0xCCDDD1F3),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 32.0),
        child: Stack(
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text(
                "Meetup",
                style: TextStyle(
                    color: ColorManager.purple,
                    fontSize: SizeManager.s24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 52.0),
              child: Text(
                "Off-line excharge of learning experience",
                style: TextStyle(
                    fontSize: SizeManager.s12,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.purple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 210.0),
              child: Container(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 65,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.grey,
                        radius: 45,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0, top: 16.0),
                      child: Image.asset(
                        ImageAssets.banner1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0, left: 20.0),
                      child: Image.asset(ImageAssets.banner3),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0, left: 80.0),
                      child: Image.asset(ImageAssets.banner2),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
