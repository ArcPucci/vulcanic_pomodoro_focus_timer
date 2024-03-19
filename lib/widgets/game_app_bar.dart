import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar({
    super.key,
    this.onExit,
    this.onDelete,
    this.onEdit,
    this.onReset,
    this.hasReset = false,
    required this.title,
  });

  final VoidCallback? onExit;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onReset;
  final bool hasReset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onExit,
                child: Transform.rotate(
                  angle: pi,
                  child: Image.asset(
                    'assets/png/buttons/next.png',
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                title,
                style: AppTextStyles.textStyle2.copyWith(
                  fontSize: 22.r,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              GestureDetector(
                onTap: onDelete,
                child: Image.asset(
                  'assets/png/buttons/delete.png',
                  width: 45.w,
                  height: 45.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: onEdit,
                child: Image.asset(
                  'assets/png/buttons/edit.png',
                  width: 45.w,
                  height: 45.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16.h),
              if (hasReset)
                GestureDetector(
                  onTap: onReset,
                  child: Image.asset(
                    'assets/png/buttons/reset.png',
                    width: 45.w,
                    height: 45.h,
                    fit: BoxFit.contain,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
