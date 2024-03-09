import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
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
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: AppTheme.gradient2,
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
