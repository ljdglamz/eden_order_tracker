import 'package:flutter/material.dart';
import 'package:order_tracker/theme/app_colors.dart';

class IconContainer extends StatelessWidget {
  final String image;
  final Function() onTap;
  final bool isLoading;
  const IconContainer(
      {required this.image,
      required this.onTap,
      super.key,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (isLoading) {
          return;
        }
        onTap();
      },
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.lightprimary.withOpacity(0.5)),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 34,
                  width: 34,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
              : Image.asset(
                  image,
                  height: 28,
                ),
        ),
      ),
    );
  }
}
