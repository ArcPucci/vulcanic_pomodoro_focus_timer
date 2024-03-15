import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18.h),
        CustomAppBar(
          text: 'Statistics',
          button: 'assets/png/buttons/calendar.png',
          onTap: () => onShowCalendar(context),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Column(
              children: [
                OverallStatistics(
                  title: 'Total:',
                  minutes: 150,
                  repeats: 20,
                  titleHasGradient: true,
                ),
                SizedBox(height: 20.h),
                OverallStatistics(title: 'Work:', minutes: 150, repeats: 20),
                SizedBox(height: 20.h),
                OverallStatistics(title: 'Rest:', minutes: 150, repeats: 20),
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
                TimerStatistics(),
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
                SizedBox(height: 20.h),
                Column(
                  children: List.generate(
                    2,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 18.h),
                        child: StatisticsGroup(),
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
  }

  void onShowCalendar(BuildContext context) async {
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
              ),
            ],
          ),
        );
      },
    );
  }
}
