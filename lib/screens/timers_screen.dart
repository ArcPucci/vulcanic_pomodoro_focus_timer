import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/timer_card.dart';

class TimersScreen extends StatelessWidget {
  const TimersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18.h),
        SizedBox(
          width: 343.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Timers', style: AppTextStyles.textStyle2),
              Image.asset(
                'assets/png/buttons/clock.png',
                width: 50.w,
                height: 50.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: TimerCard(back: backs[index % 7]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyBody() {
    return Column(
      children: [
        SizedBox(height: 180.h),
        Image.asset(
          'assets/png/logo.png',
          width: 150.w,
          height: 155.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 10.h),
        Text(
          'No pomodoro timers yet...',
          style: AppTextStyles.textStyle2.copyWith(
            fontSize: 16.r,
            color: AppTheme.whiteGray.withOpacity(0.94),
          ),
        ),
      ],
    );
  }
}
