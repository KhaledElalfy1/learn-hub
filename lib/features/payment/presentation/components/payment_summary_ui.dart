import 'package:flutter/material.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/style_manager.dart';

class PaymentSummaryUi extends StatelessWidget {
  const PaymentSummaryUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 1.5,
      child: Padding(
        padding:const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
            "Order Summary",
            style: StyleManager.titlePoppins(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 60,),
          const OrderSummaryItems(subTitle: "SubTotal",price: "99.00",),
          const SizedBox(height: 24,),
          const OrderSummaryItems(subTitle: "Shipping",price: "5.00",),
          const SizedBox(height: 24,),
          const OrderSummaryItems(subTitle: "Tax",price: "9.00",),
          const SizedBox(height: 24,),
          const Divider(),
          const SizedBox(height: 24,),
          OrderSummaryItems(subTitle: "Total",price: "113.00",textStyle: StyleManager.mediumPoppins(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryItems extends StatelessWidget {
  final String price;
  final String subTitle;
  final TextStyle? textStyle;

  const OrderSummaryItems({super.key, required this.price, required this.subTitle , this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            subTitle,
            style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
          ),
        Text(
            "\$ $price",
            style: textStyle??StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
          ),
      ],
    );
  }
}