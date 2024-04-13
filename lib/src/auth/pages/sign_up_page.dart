import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/core/widgets/app_button.dart';
import 'package:presentation/core/widgets/app_input_field.dart';
import 'package:presentation/core/widgets/app_sizer.dart';
import 'package:presentation/src/auth/controller/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///First we have to put controller
    ///It will create our controller in app
    ///After that, We can use it
    ///Verify the log
    ///log : Instance "AuthController" has been created
    ///log : Instance "AuthController" has been initialized
    final controller = Get.put(AuthController());

    ///As you see, I am not wrapping any get 's widget
    ///Reason: I am not updating any state or not updating the widget
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppInputField(
                controller: controller.userNameController,
                hintText: 'UserName',
              ),
              const HeightBox(12),
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
              AppInputField(
                controller: controller.confirmPasswordController,
                hintText: 'Confirm Password',
              ),
              const HeightBox(12),
              AppButton(
                btnName: 'Sign Up',
                onTap: controller.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
