import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    this.onTap,
    this.button,
  });

  final VoidCallback? onTap;
  final String? button;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppTextStyles.textStyle2),
          if (button != null)
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                button!,
                width: 50.w,
                height: 50.h,
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }
}
