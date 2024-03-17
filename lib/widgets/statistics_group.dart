import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class StatisticsGroup extends StatelessWidget {
  const StatisticsGroup({
    super.key,
    required this.statistics,
    required this.dateTime,
    required this.onDelete,
  });

  final List<Statistics> statistics;
  final DateTime dateTime;
  final void Function(Statistics) onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 343.w,
          child: Text(
            dateTime.shortFormat,
            style: AppTextStyles.textStyle2.copyWith(
              fontSize: 20.r,
              color: AppTheme.gray2.withOpacity(0.73),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Column(
          children: List.generate(
            statistics.length,
            (index) {
              final statistics = this.statistics[index];
              return Column(
                children: [
                  if (index == 0) GradientDivider(),
                  HistoryCard(
                    statistics: statistics,
                    onDelete: () => onDelete(statistics),
                  ),
                  GradientDivider(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
