import 'package:flutter/material.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';

class AppCurrencyWidget extends StatelessWidget {
  final String amount;

  const AppCurrencyWidget({required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("₦",
            style: body.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: "",
              color: AppColors.white.withOpacity(0.7),
            )),
        Text(amount,
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: body.copyWith(color: AppColors.white.withOpacity(0.7))),
      ],
    );
  }
}
