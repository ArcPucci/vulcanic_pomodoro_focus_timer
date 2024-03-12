import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class TimersScreen extends StatelessWidget {
  const TimersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18.h),
        CustomAppBar(
          text: 'Timers',
          button: 'assets/png/buttons/clock.png',
          onTap: () => onCreateTimer(context),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: TimerCard(
                  onPlay: () => context.go('/timer'),
                  onDelete: () => onDelete(context),
                  onEdit: () => onCreateTimer(context),
                  back: backs[index % 7],
                ),
              );
            },
          ),
        ),
      ],
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
        return CreateTimerSheet();
      },
    );
  }

  void onDelete(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CustomDeleteDialog();
      },
    );
  }
}
