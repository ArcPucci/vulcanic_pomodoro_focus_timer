import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class TotalStatistics extends StatelessWidget {
  const TotalStatistics({
    super.key,
    required this.statistics,
  });

  final Statistics statistics;

  @override
  Widget build(BuildContext context) {
    final workTime = statistics.workTime;
    final restTime = statistics.restTime;
    final workRepeats = statistics.workRepeats;
    final restRepeats = statistics.restRepeats;
    return Column(
      children: [
        OverallStatistics(
          title: 'Total:',
          minutes: workTime + restTime,
          repeats: workRepeats + restRepeats,
          titleHasGradient: true,
        ),
        SizedBox(height: 20.h),
        OverallStatistics(
          title: 'Work:',
          minutes: workTime,
          repeats: workRepeats,
        ),
        SizedBox(height: 20.h),
        OverallStatistics(
          title: 'Rest:',
          minutes: restTime,
          repeats: restRepeats,
        ),
      ],
    );
  }
}
