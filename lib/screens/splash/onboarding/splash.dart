import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/constants/global_variables.dart';
import 'package:order_tracker/screens/dashboard/dashboard.dart';
import 'package:order_tracker/screens/splash/onboarding/onboarding.dart';
import 'package:order_tracker/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/eden_logo.png",
                height: 120,
              ),
              SizedBox(
                height: size.height * 0.35,
              ),
              Image.asset(
                "assets/loader.png",
                height: 50,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ));
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    var loginUser = FirebaseAuth.instance.currentUser;
    if (loginUser == null) {
      Get.offAll(const Onboarding());
    } else {
      currentUser = loginUser;
      Get.offAll(() => const DashBoard());
    }
  }
}
