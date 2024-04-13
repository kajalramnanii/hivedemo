import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/core/database/hive_manager.dart';
import 'package:presentation/src/auth/models/user_model.dart';
import 'package:presentation/src/auth/pages/sign_in_page.dart';
import 'package:presentation/src/home/pages/home_page.dart';

class AuthController extends GetxController {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  signUp() {
    if (userNameController.text == "" ||
        emailController.text == "" ||
        passwordController.text == "" ||
        confirmPasswordController.text == "") {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "Field can not be empty",
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "Password not match",
        ),
      );
      return;
    }

    UserModel userModel = UserModel(
        email: emailController.text,
        id: Random().nextInt(100),
        password: passwordController.text,
        userName: userNameController.text);

    ///I am using spread operator to avoid boilerplate code
    ///Without spread operator code looks like this:
    ///HiveManager.instance.init('hiveBox');
    ///HiveManager.instance.addData(data: {});
    HiveManager.instance
      ..init('user')
      ..addData(data: userModel.toJson());

    Get.off(() => const SignInPage());
  }

  signIn() async {
    if (emailController.text == "" || passwordController.text == "") {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "Field can not be empty",
        ),
      );
    }

    HiveManager.instance.init('user');
    var data = await HiveManager.instance.getData();

    List<UserModel> users = [];

    for (int i = 0; i < data.length; i++) {
      var userMap = data.getAt(i);
      UserModel model = UserModel.fromJson(Map.from(userMap));

      users.add(model);
    }

    if (users.isEmpty) return;

    int index = users.indexWhere((element) =>
        element.email!.toLowerCase() == emailController.text.trim());

    if (index >= 0) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Success",
          message: "Login Success",
        ),
      );
      Get.off(() => const HomePage());
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "Invalid credentails",
        ),
      );
    }
  }

  ///Good Habit
  ///Dispose every controller you defined in Your Get Controller
  ///Reason : Better performance
  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
