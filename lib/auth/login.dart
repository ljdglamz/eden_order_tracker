import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:order_tracker/auth/auth_page.dart';
import 'package:order_tracker/auth/auth_services/auth_service.dart';
import 'package:order_tracker/constants/app_padding.dart';
import 'package:order_tracker/constants/global_variables.dart';
import 'package:order_tracker/helpers/helper_function.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';
import 'package:order_tracker/widget/app_button.dart';
import 'package:order_tracker/widget/app_scaffold.dart';
import 'package:order_tracker/widget/app_textfeild.dart';
import 'package:order_tracker/widget/icon_container.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool githubLoading = false;
  bool googleLoading = false;

  void setGoogleState(bool state) {
    googleLoading = state;
    setState(() {});
  }

  void setGithubState(bool state) {
    githubLoading = state;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppScaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPadding),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.14,
            ),
            Text(
              "Login",
              style: header.copyWith(fontWeight: FontWeight.w700),
            ),
            Gap(eight),
            Text(
              "Access account",
              style: body.copyWith(color: AppColors.white),
            ),
            Gap(spaceBetween),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconContainer(
                  isLoading: githubLoading,
                  onTap: () async {
                    setGithubState(true);
                    var user = await AuthServices.githubSigning();
                    setGithubState(false);
                    if (user != null) {
                      currentUser = user;

                      Get.offAll(() => const AuthPage());
                    }
                  },
                  image: "assets/git.png",
                ),
                IconContainer(
                  isLoading: googleLoading,
                  onTap: () async {
                    setGoogleState(true);
                    var user = await AuthServices.signinWithGoogle();
                    setGoogleState(false);
                    if (user != null) {
                      currentUser = user;
                      Get.offAll(() => const AuthPage());
                    }
                  },
                  image: "assets/google.png",
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              "Or login with email",
              style: body.copyWith(color: AppColors.white),
            ),
            Gap(spaceBetween),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppTextField(
                      labelText: "Email",
                      controller: emailController,
                      hintText: "email",
                    ),
                    Gap(spaceBetween),
                    AppTextField(
                      obscureText: true,
                      isPassword: true,
                      labelText: "Password",
                      controller: passwordController,
                      hintText: "******",
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    AppButton(
                        borderRaduis: 8,
                        text: "Login",
                        onPressed: () {
                          showAppSnackBar("Comming soon");
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
