import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.textStyle,
  });

  final VoidCallback? onTap;
  final Color? color;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343.w,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: color ?? AppTheme.dark.withOpacity(0.73),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.textStyle7,
        ),
      ),
    );
  }
}
