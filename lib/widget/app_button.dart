// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';

class AppButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  double borderRaduis;
  final Color? color;
  final bool disabled;
  final double? textHeight;
  final double? border;
  final FontWeight? textWeight;
  AppButton(
      {this.borderRaduis = 0,
      required this.text,
      this.color,
      this.textHeight,
      this.textWeight,
      this.border,
      this.disabled = false,
      required this.onPressed,
      super.key});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width,
      child: ElevatedButton(
          onPressed: () {
            if (widget.disabled) {
              return;
            }
            widget.onPressed();
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(const EdgeInsets.all(.0)),
              backgroundColor: MaterialStateProperty.all(widget.disabled
                  ? const Color(0xFF00445B)
                  : widget.color ?? AppColors.primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRaduis)))),
          child: Text(widget.text,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: body.copyWith(
                  fontWeight: widget.textWeight ?? FontWeight.w700,
                  color: AppColors.white,
                  fontSize: widget.textHeight ?? 14))),
    );
  }
}
