import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    this.onTap,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343.w,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppTheme.dark.withOpacity(0.73),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTextStyles.textStyle7,
        ),
      ),
    );
  }
}
