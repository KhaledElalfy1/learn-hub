import 'package:flutter/material.dart';
import '../../../../core/managers/style_manager.dart';

class ExpirationAndCVV extends StatelessWidget {
  const ExpirationAndCVV({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Expiration",
          style: StyleManager.mediumPoppins(),
        ),
        const SizedBox(
          width: 90,
        ),
        Text(
          "CVV",
          style: StyleManager.mediumPoppins(),
        ),
      ],
    );
  }
}
