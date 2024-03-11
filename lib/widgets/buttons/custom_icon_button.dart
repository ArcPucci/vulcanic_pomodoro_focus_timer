import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.asset,
    this.enabled = true,
  });

  final VoidCallback? onTap;
  final String asset;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: enabled ? AppTheme.gradient1 : null,
        color: enabled ? null : AppTheme.dark.withOpacity(0.73),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        asset,
        fit: BoxFit.contain,
      ),
    );
  }
}
