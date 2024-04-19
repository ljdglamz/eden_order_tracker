import 'package:flutter/material.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';
import 'package:order_tracker/widget/currency_widget.dart';

class OrderItems extends StatelessWidget {
  final String title;
  final String itemTag;
  final bool? isPrice;
  const OrderItems(
      {required this.itemTag,
      required this.title,
      this.isPrice = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: body.copyWith(
              fontSize: 14, color: AppColors.white.withOpacity(0.7)),
        ),
        const Spacer(),
        isPrice == false
            ? Expanded(
                child: Text(
                itemTag,
                textAlign: TextAlign.end,
                style: body.copyWith(color: AppColors.white.withOpacity(0.7)),
              ))
            : AppCurrencyWidget(
                amount: itemTag,
              )
      ],
    );
  }
}
