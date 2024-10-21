import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';

class LessonItem extends StatefulWidget {
  const LessonItem({
    super.key, required this.numOfLesson, required this.lessonName, required this.lessonTime,
  });
final String numOfLesson;
final String lessonName;
final String lessonTime;
  @override
  State<LessonItem> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeManager.s16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeManager.s40.w,
            child: Text(
              widget.numOfLesson,
              style: StyleManager.mediumPoppins(color: ColorManager.lighterGrey,fontSize: 25),
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.lessonName,
                  style: TextStyle(
                    fontSize: SizeManager.s16.w,
                    overflow: TextOverflow.ellipsis
                  )),
              Row(

                children: [
                  SizedBox(
                    width: 85,
                    child: Text(widget.lessonTime,
                        style:
                            StyleManager.mediumPoppins(color: ColorManager.blue,fontSize: SizeManager.s14.w,)),
                  ),
                   SizedBox(width: 5,),
                   const Icon(Icons.check_circle, color: ColorManager.blue,size: 19,)
                ],
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                // controller.value.isPlaying
                //     ? controller.pause()
                //     : controller.play();
              });
            },
            child: Container(
              width: 44.dm,
              height: 44.dm,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.blue,
              ),
              child: const Icon(
                // _controller.value.isPlaying ?
                // Icons.pause :
                Icons.play_arrow,
                color: ColorManager.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataCourseModel{
 final String numberOfLesson;
 final String lessonName;
 final String lessonTime;
 DataCourseModel({required this.numberOfLesson, required this.lessonName, required this.lessonTime});
}
List<DataCourseModel> lessonOfData = [
  DataCourseModel(numberOfLesson: '01', lessonName: 'Welcome to flutter', lessonTime: '12:55 mins'),
  DataCourseModel(numberOfLesson: '02', lessonName: 'Introduction about Widgets', lessonTime: '9:50 mins'),
  DataCourseModel(numberOfLesson: '03', lessonName: 'Stateless Widget', lessonTime: '3:10 mins'),
  DataCourseModel(numberOfLesson: '04', lessonName: 'Stateful Widget', lessonTime: '17:30 mins'),
  DataCourseModel(numberOfLesson: '05', lessonName: 'Welcome to flutter', lessonTime: '12:27 mins'),
  DataCourseModel(numberOfLesson: '06', lessonName: 'Introduction about Widgets', lessonTime: '7:30 mins'),
];
