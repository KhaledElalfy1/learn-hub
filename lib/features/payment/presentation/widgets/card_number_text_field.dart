import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/managers/color_manager.dart';
import 'card_number_informatter.dart';

class CardNumberTextField extends StatefulWidget {
  const CardNumberTextField({super.key});

  @override
  State<CardNumberTextField> createState() => _CardNumberTextFieldState();
}

class _CardNumberTextFieldState extends State<CardNumberTextField> {
  final TextEditingController cardNumberController = TextEditingController();
  final FocusNode cardNumberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(() {
      if (cardNumberController.text.length == 19) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    cardNumberController.dispose();

    cardNumberFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cardNumberController,
      focusNode: cardNumberFocusNode,
      keyboardType: TextInputType.number,
      // maxLength: 19,
      decoration: InputDecoration(
        hintText: '0000 0000 0000 0000',
        hintStyle: TextStyle(color: Colors.grey[600]),
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: ColorManager.purple,
            width: 1.0,
          ),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(19),
        CardNumberInputFormatter()
      ],
    );
  }
}
