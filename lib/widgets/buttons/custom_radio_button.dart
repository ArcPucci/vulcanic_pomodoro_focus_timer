import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    this.onTap,
    required this.selected,
  });

  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 23.sp,
        height: 23.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? null : Colors.transparent,
          gradient: selected ? AppTheme.gradient3 : null,
          border: GradientBoxBorder(
            gradient: AppTheme.gradient6,
            width: 2.sp,
          ),
        ),
      ),
    );
  }
}
