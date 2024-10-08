
import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';

const totalTime = 46;

class HomeGetStartedUi extends StatelessWidget {
  const HomeGetStartedUi({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 150,
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                    color: ColorManager.lightGrey.withOpacity(.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 32.0, right: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Learned today",
                      style: TextStyle(
                          fontSize: SizeManager.s20,
                          color: ColorManager.lightGrey),
                    ),
                    Text(
                      "My courses",
                      style: TextStyle(
                          fontSize: SizeManager.s18, color: ColorManager.blue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "$totalTime min",
                      style: TextStyle(
                          fontSize: SizeManager.s32,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " / 60min",
                      style: TextStyle(
                          color: ColorManager.lightGrey,
                          fontSize: SizeManager.s20),
                    )
                  ],
                ),
                Row(
                  children: [
                    ColorPicker(totalTime * 5.5, ColorManager.orange,
                        ColorManager.white),
                    ColorPicker((60 - totalTime) * 5.5, ColorManager.grey,
                        ColorManager.grey),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorPicker extends StatefulWidget {
  final double width;
  final Color firstColor;
  final Color secondColor;
  ColorPicker(this.width, this.firstColor, this.secondColor);
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            width: widget.width,
            height: 10,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  widget.firstColor,
                  widget.secondColor,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
