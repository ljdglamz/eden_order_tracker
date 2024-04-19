import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:order_tracker/constants/app_padding.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';

class ActionButtons extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const ActionButtons(
      {super.key,
      required this.onTap,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.lightprimary.withOpacity(0.4)),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(spaceBetween),
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                        height: 50,
                        width: 50,
                      ),
                    )),
                Gap(tweleve),
                Text(text, style: body.copyWith(fontWeight: FontWeight.w600)),
                Gap(spaceBetween),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
