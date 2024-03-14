import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class OverallStatistics extends StatelessWidget {
  const OverallStatistics({
    super.key,
    required this.title,
    required this.minutes,
    required this.repeats,
    this.titleHasGradient = false,
  });

  final String title;
  final bool titleHasGradient;
  final int minutes;
  final int repeats;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 37.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.sp,
            color: AppTheme.black.withOpacity(0.9),
          ),
        ),
      ),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildTitle()),
          Expanded(
            child: Text(
              '${minutes ~/ 60}h ${(minutes % 60).toString().padLeft(2, '0')}m',
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle2.copyWith(
                fontSize: 22.r,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/png/volcanoes/standart.png',
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 8.w),
                Text(
                  '$repeats',
                  style: AppTextStyles.textStyle2.copyWith(
                    fontSize: 22.r,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    if (titleHasGradient) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return AppTheme.gradient1.createShader(bounds);
        },
        child: Text(
          title,
          style: AppTextStyles.textStyle2.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      );
    }
    return Text(
      title,
      style: AppTextStyles.textStyle2.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20.r,
      ),
    );
  }
}
