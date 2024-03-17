import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class TimersScreen extends StatelessWidget {
  const TimersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimersProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            SizedBox(height: 18.h),
            CustomAppBar(
              text: 'Timers',
              button: 'assets/png/buttons/clock.png',
              onTap: () => onCreateTimer(context),
            ),
            Expanded(
              child: value.timers.isEmpty
                  ? _buildEmptyBody()
                  : ListView.builder(
                      itemCount: value.timers.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 24.h,
                      ),
                      itemBuilder: (context, index) {
                        final timerView = value.timers[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: TimerCard(
                            onPlay: () => value.onSelectTimer(timerView),
                            onDelete: () async {
                              if (!await onDelete(context)) return;
                              value.onDeleteTimer(timerView);
                            },
                            onEdit: () {
                              value.onChangeTimer(timerView);
                              onEditTimer(context);
                            },
                            back: backs[index % 7],
                            timerView: timerView,
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmptyBody() {
    return Column(
      children: [
        SizedBox(height: 180.h),
        Image.asset(
          'assets/png/logo.png',
          width: 150.w,
          height: 155.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 10.h),
        Text(
          'No pomodoro timers yet...',
          style: AppTextStyles.textStyle2.copyWith(
            fontSize: 16.r,
            color: AppTheme.whiteGray.withOpacity(0.94),
          ),
        ),
      ],
    );
  }

  void onCreateTimer(BuildContext context) async {
    await showBottomSheet(
      context: context,
      builder: (context) {
        return CreateTimerSheet(
          timersProvider: Provider.of(context, listen: false),
        );
      },
    );
  }

  void onEditTimer(BuildContext context) async {
    await showBottomSheet(
      context: context,
      builder: (context) {
        return CreateTimerSheet(
          isEdit: true,
          timersProvider: Provider.of(context, listen: false),
        );
      },
    );
  }

  Future<bool> onDelete(BuildContext context) async {
    return await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CustomDeleteDialog(
          title: 'Remove Pomodoro Timer?',
          content: 'Are you sure you want to remove this timer?',
        );
      },
    );
  }
}
