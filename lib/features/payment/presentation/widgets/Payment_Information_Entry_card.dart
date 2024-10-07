import 'package:flutter/material.dart';
import '../components/payment_btn_ui.dart';
import '../components/payment_input_field_ui.dart';
import '../components/payment_title&subtitle_ui.dart';

class PaymentInformationEntry extends StatelessWidget {
  const PaymentInformationEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 1.5,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            PaymentTitleAndSubTitle(),
            SizedBox(
              height: 60,
            ),
            PaymentInputField(),
            PaymentButtonUi()
          ],
        ),
      ),
    );
  }
}
