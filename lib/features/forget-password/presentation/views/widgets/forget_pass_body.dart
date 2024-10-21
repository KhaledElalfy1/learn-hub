import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/core/managers/style_manager.dart';
import '../../../../../core/managers/string_manager.dart';
import '../../../../login/presentation/components/login_section.dart';
import '../../view_model/cubit/reset_pass_cubit.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocListener<ResetPassCubit, ResetPassState>(
        listener: (context, state) {
          if (state is ResetPassSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(StringManager.resetEmailSuccess),
            ));
          } else if (state is ResetPassFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          }
        },
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringManager.enterEmailToReset, style: StyleManager.mediumPoppins(),),
              const SizedBox(height: 18),
              CustomTextFormField(
                labelText: StringManager.yourEmail,
                controller: emailController,
                textType: TextInputType.emailAddress,
                validator: (input) {
                  if (input!.isEmpty) {
                    return "fill your email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<ResetPassCubit, ResetPassState>(
                builder: (context, state) {
                  if (state is ResetPassLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final email = emailController.text;
                      context
                          .read<ResetPassCubit>()
                          .sendResetPasswordEmail(email);
                    } else {
                      return;
                    }
                  },
                    child: Text(StringManager.sendResetEmail),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
