import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpirationDateAndCVVTextField extends StatefulWidget {
  const ExpirationDateAndCVVTextField({super.key});

  @override
  State<ExpirationDateAndCVVTextField> createState() =>
      _ExpirationDateAndCVVTextFieldState();
}

class _ExpirationDateAndCVVTextFieldState
    extends State<ExpirationDateAndCVVTextField> {
  final TextEditingController expiryYearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  String? selectedMonth;
  final List<String> months = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];

  final FocusNode expiryYearFocusNode = FocusNode();
  final FocusNode cvvFocusNode = FocusNode();
  final FocusNode monthFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    expiryYearController.addListener(() {
      if (expiryYearController.text.length == 4) {
        FocusScope.of(context).requestFocus(cvvFocusNode);
      }
    });
    cvvController.addListener(() {
      if (cvvController.text.length == 3) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    expiryYearController.dispose();
    cvvController.dispose();
    expiryYearFocusNode.dispose();
    cvvFocusNode.dispose();
    monthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            focusNode: monthFocusNode,
            value: selectedMonth,
            hint: const Text('MM'),
            items: months.map((String month) {
              return DropdownMenuItem<String>(
                value: month,
                child: Text(month),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedMonth = newValue;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextField(
            controller: expiryYearController,
            focusNode: expiryYearFocusNode,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'YYYY',
              border: OutlineInputBorder(),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextField(
            controller: cvvController,
            focusNode: cvvFocusNode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '123',
              hintStyle: TextStyle(color: Colors.grey[600]),
              border: const OutlineInputBorder(),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
          ),
        ),
      ],
    );
  }
}
