import 'package:flutter/material.dart';
import 'dart:developer';


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:quickalert/quickalert.dart';

class PaypalCheckoutViewFunc extends StatelessWidget {
  const PaypalCheckoutViewFunc({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return PaypalCheckoutView(
                          sandboxMode: true,
                          clientId: dotenv.env['PAYPAL_CLIENT_ID'],
                          secretKey: dotenv.env['PAYPAL_CLIENT_SECRET'],
                          transactions: [
                            {
                              "amount": {
                                // The total must be the sum of subtotal + shipping - shipping_discount
                                "total":
                                    (double.parse(courseModel.price) + 1 - 0)
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
                                text:
                                    'Payment was successful you can now access the course');
                          },
                          onError: (error) {
                            log("onError: $error");
                            Navigator.pop(context);
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Error',
                                text: '$error');
                          },
                          onCancel: () {
                            log('cancelled:');
                            Navigator.pop(context);
                          },
                        );
  }
}