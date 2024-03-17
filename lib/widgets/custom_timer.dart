import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({
    super.key,
    required this.seconds,
    required this.percent,
    this.onTap,
    required this.timerView,
    required this.workTime,
  });

  final int seconds;
  final double percent;
  final VoidCallback? onTap;
  final TimerView timerView;
  final bool workTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Consumer<StoreProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Positioned(
              left: 0,
              right: 0,
              bottom: (value.volcano.id == 0 && workTime) ? 230.h : 200.h,
              child: Center(
                child: Transform.scale(
                  scale: 2,
                  child: Lottie.asset(
                    workTime ? value.volcano.workJson : value.volcano.restJson,
                    width: 220.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: onTap,
          child: Stack(
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
                percent: percent,
                startAngle: 60,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      seconds.minutesAndSeconds,
                      style: AppTextStyles.textStyle10,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      workTime
                          ? '${timerView.restTime.toString().padLeft(2, '0')}:00'
                          : '${timerView.workTime.toString().padLeft(2, '0')}:00',
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
        ),
      ],
    );
  }
}
