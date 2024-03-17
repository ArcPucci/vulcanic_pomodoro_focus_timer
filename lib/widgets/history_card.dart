import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.statistics,
    this.onDelete,
  });

  final Statistics statistics;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: BehindMotion(),
        extentRatio: 0.15,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                color: AppTheme.red2,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/png/icons/delete.png',
                  width: 12.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Container(
        width: 375.w,
        height: 73.h,
        color: AppTheme.bg,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              statistics.title,
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
                      statistics.time,
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
                      statistics.workTime.hoursAndMinutes,
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
                      statistics.restTime.hoursAndMinutes,
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
                      '${statistics.restRepeats + statistics.workRepeats}',
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
      ),
    );
  }
}
