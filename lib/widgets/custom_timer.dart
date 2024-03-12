import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 205.h,
          child: Center(
            child: Transform.scale(
              scale: 2,
              child: Lottie.asset(
                'assets/json/standart_work.json',
                height: 297.r,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 234.r,
              height: 234.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.bg,
                border: GradientBoxBorder(
                  gradient: AppTheme.gradient2,
                  width: 7.r,
                ),
              ),
            ),
            CircularPercentIndicator(
              radius: 125.r,
              lineWidth: 8.r,
              percent: 0.9,
              startAngle: 60,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '24:15',
                    style: AppTextStyles.textStyle10,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '05:00',
                    style: AppTextStyles.textStyle10.copyWith(
                      fontSize: 30.r,
                      color: AppTheme.gray2.withOpacity(0.73),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              linearGradient: AppTheme.gradient3,
              reverse: true,
            ),
          ],
        ),
      ],
    );
  }
}
