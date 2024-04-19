import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:order_tracker/auth/login.dart';
import 'package:order_tracker/constants/app_padding.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';
import 'package:order_tracker/widget/app_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/delivery.png",
                  height: size.height * 0.3,
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Text(
                "Welcome to 👋 ",
                style: header.copyWith(color: AppColors.black, fontSize: 30),
              ),
              Gap(tweleve),
              Text(
                "Eden Life ",
                style: header.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                    fontSize: 44),
              ),
              Gap(tweleve),
              Text(
                "The best app for ordering and tracking your orders in the country.",
                textAlign: TextAlign.center,
                style: body.copyWith(color: AppColors.primaryColor),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: size.width * 0.4,
                  child: AppButton(
                    borderRaduis: 8,
                    text: "Get Started",
                    onPressed: () => Get.offAll(const Login()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
