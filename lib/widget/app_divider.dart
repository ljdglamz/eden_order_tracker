import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:order_tracker/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  const AppDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 2.0,
      dashLength: 4.0,
      dashColor: color ?? AppColors.black.withOpacity(0.4),
      dashRadius: 4.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 4.0,
    );
  }
}
