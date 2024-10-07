import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_primary_elevated_btn.dart';

class PaymentButtonUi extends StatelessWidget {
  const PaymentButtonUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: CustomPrimaryElevatedBtn(
          onPressed: () {},
          buttonTxt: "Pay Now",
          btnWidth: double.infinity,
        ));
  }
}
