import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            SizedBox(height: 18.h),
            CustomAppBar(
              text: 'Statistics',
              button: 'assets/png/buttons/calendar.png',
              onTap: () => onShowCalendar(context, value),
            ),
            Expanded(
              child: value.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: Column(
                        children: [
                          TotalStatistics(statistics: value.totalStatistics),
                          if (!value.firstTime) ...[
                            SizedBox(height: 28.h),
                            SizedBox(
                              width: 343.w,
                              child: Text(
                                'Statistic for each timer:',
                                style: AppTextStyles.textStyle2.copyWith(
                                  fontSize: 20.r,
                                  color: AppTheme.gray2.withOpacity(0.73),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Column(
                              children: List.generate(
                                value.timerStatistics.length,
                                (index) {
                                  final statistics =
                                      value.timerStatistics[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: TimerStatistics(
                                      statistics: statistics,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                          SizedBox(height: 28.h),
                          SizedBox(
                            width: 343.w,
                            child: Text(
                              'History:',
                              style: AppTextStyles.textStyle2.copyWith(
                                fontSize: 22.r,
                              ),
                            ),
                          ),
                          if (value.firstTime) ...[
                            SizedBox(height: 16.h),
                            SizedBox(
                              width: 343.w,
                              child: Text(
                                'Information will be arriving soon:',
                                style: AppTextStyles.textStyle8.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.gray2.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                          SizedBox(height: 20.h),
                          Column(
                            children: List.generate(
                              value.dateTimes.length,
                              (index) {
                                final date = value.dateTimes[index];
                                final list = value.allStatistics[date] ?? [];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 18.h),
                                  child: StatisticsGroup(
                                    statistics: list,
                                    dateTime: date,
                                    onDelete: (sts) async {
                                      if(!await onDelete(context)) return;
                                      value.onDelete(sts);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 100.h),
                        ],
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  void onShowCalendar(BuildContext context, StatisticsProvider value) async {
    await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return SafeArea(
          child: Column(
            children: [
              SizedBox(height: 18.h),
              CustomAppBar(
                text: 'Statistics',
                button: 'assets/png/buttons/calendar2.png',
                onTap: Navigator.of(context).pop,
              ),
              SizedBox(height: 12.h),
              CalendarWidget(
                initialDate: DateTime.now(),
                dates: value.dates,
                onChangeRange: value.onChangeRange,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> onDelete(BuildContext context) async {
    return await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CustomDeleteDialog(
          title: 'Delete the record from history?',
          content:
              'Are you sure you want to remove this note from history? This will update your overall statistics.',
        );
      },
    );
  }
}
