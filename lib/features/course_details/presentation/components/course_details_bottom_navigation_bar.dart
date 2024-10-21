import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/features/course_details/presentation/widgets/course_details_icon_button.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../core/widgets/custom_primary_elevated_btn.dart';

class CourseDetailsBottomNavigationBar extends StatelessWidget {
  const CourseDetailsBottomNavigationBar(
      {super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 90.h,
      padding: EdgeInsets.only(
          right: SizeManager.s16.w,
          left: SizeManager.s16.w,
          bottom: MediaQuery.paddingOf(context).bottom),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(SizeManager.s20.r)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 15,
                color: ColorManager.lighterGrey.withOpacity(0.502))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CourseDetailsIconButton(onTap: () {}),
          SizeManager.s14.horizontalSpace,
          Expanded(
              child: CustomPrimaryElevatedBtn(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: dotenv.env['PAYPAL_CLIENT_ID'],
                    secretKey: dotenv.env['PAYPAL_CLIENT_SECRET'],
                    transactions: [
                      {
                        "amount": {
                          // The total must be the sum of subtotal + shipping - shipping_discount
                          "total": (double.parse(courseModel.price) + 1 - 0)
                              .toString(),
                          "currency": "USD",
                          "details": {
                            "subtotal": courseModel.price.toString(),
                            "shipping":
                                '1', // Ensure this is a valid numeric value
                            "shipping_discount":
                                '0' // This should be a string, even if 0
                          }
                        },
                        "description":
                            "Buying a course for educational purposes",
                        "item_list": {
                          "items": [
                            {
                              "name": courseModel.title,
                              "quantity": 1,
                              "price": courseModel.price.toString(),
                              "currency": "USD"
                            },
                          ],
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      Navigator.pop(context);
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Success',
                          text: 'Payment was successful');
                    },
                    onError: (error) {
                      log("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
            buttonTxt: 'Buy this course',
            btnWidth: 30.w,
            btnHeight: 50.h,
          )),
        ],
      ),
    );
  }
}
