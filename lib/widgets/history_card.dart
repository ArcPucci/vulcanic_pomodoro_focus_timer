import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 73.h,
      color: AppTheme.bg,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Training',
            style: AppTextStyles.textStyle2.copyWith(
              fontSize: 18.r,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/png/timer2.png',
                    width: 14.w,
                    height: 17.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '15:45',
                    style: AppTextStyles.textStyle8.copyWith(
                      fontSize: 16.r,
                      color: AppTheme.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/png/work.png',
                    width: 17.w,
                    height: 17.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '1h 00m',
                    style: AppTextStyles.textStyle8.copyWith(
                      fontSize: 16.r,
                      color: AppTheme.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/png/rest.png',
                    width: 17.w,
                    height: 17.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '1h 00m',
                    style: AppTextStyles.textStyle8.copyWith(
                      fontSize: 16.r,
                      color: AppTheme.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/png/volcanoes/standart.png',
                    width: 17.w,
                    height: 17.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '17',
                    style: AppTextStyles.textStyle8.copyWith(
                      fontSize: 16.r,
                      color: AppTheme.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
