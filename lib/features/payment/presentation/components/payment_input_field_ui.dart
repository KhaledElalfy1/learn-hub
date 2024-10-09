import 'package:flutter/material.dart';
import '../../../../core/managers/style_manager.dart';
import '../widgets/Expiration_and_cvv_title.dart';
import '../widgets/card_number_text_field.dart';
import '../widgets/expiration_and_cvv_text_field.dart';

class PaymentInputField extends StatelessWidget {
  const PaymentInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Card Number",
          style: StyleManager.mediumPoppins(),
        ),
        const SizedBox(height: 16.0),
        const CardNumberTextField(),
        const SizedBox(
          height: 20,
        ),
        const ExpirationAndCVV(),
        const SizedBox(
          height: 20,
        ),
        const ExpirationDateAndCVVTextField(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
