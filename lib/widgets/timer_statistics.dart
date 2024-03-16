import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class TimerStatistics extends StatelessWidget {
  const TimerStatistics({
    super.key,
    required this.statistics,
  });

  final Statistics statistics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppTheme.bg,
        border: GradientBoxBorder(
          gradient: AppTheme.gradient5,
          width: 1.sp,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            statistics.title,
            style: AppTextStyles.textStyle2.copyWith(
              fontSize: 18.r,
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/png/work.png',
            width: 17.w,
            height: 17.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 4.w),
          Text(
            statistics.workTime.hoursAndMinutes,
            style: AppTextStyles.textStyle8.copyWith(
              fontSize: 16.r,
              color: AppTheme.white.withOpacity(0.9),
            ),
          ),
          SizedBox(width: 16.w),
          Image.asset(
            'assets/png/rest.png',
            width: 17.w,
            height: 17.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 4.w),
          Text(
            statistics.restTime.hoursAndMinutes,
            style: AppTextStyles.textStyle8.copyWith(
              fontSize: 16.r,
              color: AppTheme.white.withOpacity(0.9),
            ),
          ),
          SizedBox(width: 16.w),
          Image.asset(
            'assets/png/volcanoes/standart.png',
            width: 17.w,
            height: 17.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 4.w),
          Text(
            "${statistics.workRepeats + statistics.restRepeats}",
            style: AppTextStyles.textStyle8.copyWith(
              fontSize: 16.r,
              color: AppTheme.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
