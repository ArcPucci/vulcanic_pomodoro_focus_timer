import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TimerProvider(
          provider: Provider.of(context, listen: false),
        )..init();
      },
      child: Consumer2<TimerProvider, TimersProvider>(
        builder: (BuildContext context, value, value2, Widget? child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTimer(
                        seconds: value.seconds,
                        minutes: value.minutes,
                        percent: value.percent,
                        onTap: value.onStart,
                        timerView: value.timerView,
                        workTime: value.workTime,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    SizedBox(
                      width: 335.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 45.w),
                          Text(
                            'Work Time',
                            style: AppTextStyles.textStyle2.copyWith(
                              fontSize: 28.r,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => onShowComment(
                              context,
                              value.timerView,
                            ),
                            child: Image.asset(
                              'assets/png/buttons/comments.png',
                              width: 45.w,
                              height: 45.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 104.h + overlay.bottom),
                  ],
                ),
              ),
              Positioned(
                top: 20.h,
                left: 16.w,
                right: 16.w,
                child: GameAppBar(
                  onExit: () => onLeave(context),
                  onEdit: () async {
                    await onEditTimer(context);
                    print('object');
                  },
                  onDelete: () async {
                    if (!await onDelete(context)) return;
                    value2.onDeleteTimer(value.timerView);
                    context.pop();
                  },
                  onReset: value.onReset,
                  hasReset: value.canReset,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onLeave(BuildContext context) async {
    final result = await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CustomExitDialog();
      },
    );
    if (result) context.pop();
  }

  Future<bool> onDelete(BuildContext context) async {
    return await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CustomDeleteDialog();
      },
    );
  }

  Future<void> onEditTimer(BuildContext context) async {
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

  void onShowComment(BuildContext context, TimerView timerView) async {
    await showDialog(
      context: context,
      useRootNavigator: true,
      barrierColor: Color(0xFF131212).withOpacity(0.62),
      builder: (context) {
        return CommentWidget(text: timerView.comment);
      },
    );
  }
}
