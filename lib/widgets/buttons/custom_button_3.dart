import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class CustomButton3 extends StatelessWidget {
  const CustomButton3({
    super.key,
    this.onTap,
    this.enabled = false,
    this.hasToggleButton = false,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;
  final bool enabled;
  final bool hasToggleButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343.w,
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: AppTheme.gradient2,
        ),
        padding: EdgeInsets.only(left: 20.w, right: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppTextStyles.textStyle3.copyWith(
                fontSize: 20.r,
                height: 1,
              ),
            ),
            if (hasToggleButton)
              CustomToggleButton(
                enabled: enabled,
                onTap: onTap,
              ),
          ],
        ),
      ),
    );
  }
}
