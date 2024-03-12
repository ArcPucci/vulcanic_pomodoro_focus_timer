import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    this.onTap,
    required this.text,
    this.enabled = true,
    this.height,
    this.textStyle,
  });

  final VoidCallback? onTap;
  final bool enabled;
  final double? height;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 343.w,
        height: height ?? 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: enabled ? AppTheme.gradient2 : null,
          color: enabled ? null : AppTheme.dark.withOpacity(0.73),
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
