import 'package:flutter/material.dart';
import 'package:order_tracker/constants/app_padding.dart';
import 'package:order_tracker/theme/app_colors.dart';

class BorderContainer extends StatelessWidget {
  final Widget content;
  final double? containerOpacity;
  const BorderContainer({
    required this.content,
    this.containerOpacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: meduimSpaceBetween, vertical: meduimSpaceBetween),
        decoration: BoxDecoration(
            color: AppColors.white.withOpacity(containerOpacity ?? 0.1),
            borderRadius: BorderRadius.circular(meduimSpaceBetween),
            border: Border.all(color: AppColors.lightprimary)),
        child: content);
  }
}
