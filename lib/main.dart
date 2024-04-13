import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/core/config/app_config.dart';
import 'package:presentation/src/auth/pages/sign_up_page.dart';

void main() {
  AppConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpPage(),
    );
  }
}
