import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.enabled,
    this.onTap,
  });

  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 51.sp,
        height: 31.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2000),
          color: enabled ? AppTheme.green : AppTheme.light.withOpacity(0.16),
        ),
        padding: EdgeInsets.symmetric(horizontal: 3.sp),
        alignment: enabled ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: 27.sp,
          height: 27.sp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 1.r,
                color: Colors.black.withOpacity(0.06),
              ),
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 8.r,
                color: Colors.black.withOpacity(0.15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
