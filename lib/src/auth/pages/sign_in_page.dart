import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/core/widgets/app_button.dart';
import 'package:presentation/core/widgets/app_input_field.dart';
import 'package:presentation/core/widgets/app_sizer.dart';
import 'package:presentation/src/auth/controller/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppInputField(
                controller: controller.emailController,
                hintText: 'Email',
              ),
              const HeightBox(12),
              AppInputField(
                controller: controller.passwordController,
                hintText: 'Password',
              ),
              const HeightBox(12),
              AppButton(
                btnName: 'Sign In',
                onTap: controller.signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
