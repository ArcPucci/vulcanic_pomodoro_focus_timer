import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({
    super.key,
    required this.back,
    this.onPlay,
    this.onDelete,
    this.onEdit,
    required this.timerView,
  });

  final VoidCallback? onPlay;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final String back;
  final TimerView timerView;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(21),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              back,
              width: 343.w,
              height: 130.h,
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              width: 343.w,
              height: 130.h,
              decoration: BoxDecoration(
                gradient: AppTheme.gradient4,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    timerView.name,
                    style: AppTextStyles.textStyle2.copyWith(
                      fontSize: 22.r,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Work: ${timerView.workTime} min',
                            style: AppTextStyles.textStyle3,
                          ),
                          Text(
                            'Rest: ${timerView.restTime} min',
                            style: AppTextStyles.textStyle3,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 147.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: onDelete,
                              child: Image.asset(
                                'assets/png/buttons/delete.png',
                                width: 35.r,
                                height: 35.r,
                                fit: BoxFit.contain,
                              ),
                            ),
                            GestureDetector(
                              onTap: onEdit,
                              child: Image.asset(
                                'assets/png/buttons/edit.png',
                                width: 35.r,
                                height: 35.r,
                                fit: BoxFit.contain,
                              ),
                            ),
                            GestureDetector(
                              onTap: onPlay,
                              child: Image.asset(
                                'assets/png/buttons/play.png',
                                width: 45.r,
                                height: 46.r,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
