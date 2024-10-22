import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/core/utils/extensions.dart';


class SignOutSection extends StatelessWidget {
  const SignOutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            GoogleSignIn().signOut();
            await FirebaseAuth.instance.signOut();
            context.popUntilScreen(Routes.login);
          },
          icon:const Icon(Icons.logout, color: Colors.red),
        ),
       const Text(
          'logout',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )
          
        )
      ],
    );
  }
}
