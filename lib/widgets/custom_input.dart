import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.minLines,
    this.maxLength,
    required this.hintText,
    required this.controller,
    this.focusNode,
  });

  final int? maxLength;
  final int? minLines;
  final String hintText;
  final FocusNode? focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: AppTheme.black.withOpacity(0.94),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        style: AppTextStyles.textStyle8.copyWith(
          fontSize: 18.r,
          color: AppTheme.white.withOpacity(0.9),
        ),
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
        minLines: minLines,
        maxLines: minLines,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: AppTextStyles.textStyle8.copyWith(
            fontSize: 18.r,
            color: AppTheme.gray2.withOpacity(0.73),
          ),
        ),
      ),
    );
  }
}
