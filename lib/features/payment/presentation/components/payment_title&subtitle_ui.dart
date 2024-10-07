import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

class PaymentTitleAndSubTitle extends StatelessWidget {
  const PaymentTitleAndSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment",
            style: StyleManager.titlePoppins(fontWeight: FontWeight.w600),
          ),
          Text(
            "Enter your payment information",
            style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
            
          ),
        ],
      ),
    );
  }
}
