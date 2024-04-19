import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final bool readonly;
  final String? labelText;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final bool require;
  final double? width;
  final Widget? suffixIcon;
  final double? labelTextSize;
  final Color? labelTextColor;
  final Color? inPutTextColor;
  final Color? hintTextColorGiven;
  final FontWeight? width1;
  final Function(String)? onChange;
  final bool obscureText;
  final Widget? preffixIcon;
  final String? Function(String?)? validator;
  final bool isDensed;
  final bool isCollaped;

  const AppTextField(
      {required this.controller,
      required this.hintText,
      this.labelText,
      this.onTap,
      this.inPutTextColor,
      this.width,
      this.onChange,
      this.width1,
      this.validator,
      this.hintTextColorGiven,
      this.isCollaped = false,
      this.isDensed = false,
      this.preffixIcon,
      this.obscureText = false,
      this.suffixIcon,
      this.isPassword = false,
      this.labelTextSize = 13,
      this.labelTextColor,
      this.readonly = false,
      this.require = true,
      this.keyboardType,
      super.key});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Gap(12),
            if (widget.labelText != null) ...[
              Text(widget.labelText!,
                  style: body.copyWith(
                      color: widget.labelTextColor,
                      fontSize: widget.labelTextSize,
                      fontWeight: widget.width1)),
            ],
          ],
        ),
        const Gap(4),
        TextFormField(
          validator: widget.validator,
          style: TextStyle(
              overflow: TextOverflow.ellipsis, color: AppColors.white),
          readOnly: widget.readonly,
          onChanged: widget.onChange,
          obscureText: widget.obscureText && !isVisible,
          onTap: widget.onTap,
          cursorColor: AppColors.primaryColor,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
            helperStyle: const TextStyle(
              fontSize: 20,
            ),
            isDense: widget.isDensed,
            isCollapsed: widget.isCollaped,
            prefixIcon: widget.preffixIcon,
            filled: true,
            hintStyle: TextStyle(
                fontSize: 14, color: AppColors.white.withOpacity(0.6)),
            fillColor: AppColors.lightprimary.withOpacity(0.4),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      if (isVisible) {
                        isVisible = false;
                        setState(() {});
                        return;
                      }

                      isVisible = true;
                      setState(() {});
                      return;
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12),
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightprimary),
                          child: Icon(
                              isVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.white,
                              size: 16),
                        )))
                : widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                    color: Colors.transparent, width: widget.width ?? 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                    color: AppColors.lightprimary, width: widget.width ?? 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                    color: AppColors.lightprimary, width: widget.width ?? 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                    color: AppColors.lightprimary, width: widget.width ?? 2)),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
