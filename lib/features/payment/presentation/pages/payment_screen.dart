import 'package:flutter/material.dart';
import 'package:learnhub/features/payment/presentation/components/payment_summary_ui.dart';
import '../widgets/Payment_Information_Entry_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(padding: const EdgeInsets.all(20), children: const [
          PaymentInformationEntry(),
          PaymentSummaryUi()
        ]),
      ),
    );
  }
}



