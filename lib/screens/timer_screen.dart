import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: CustomTimer()),
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
                    Image.asset(
                      'assets/png/buttons/comments.png',
                      width: 45.w,
                      height: 45.h,
                      fit: BoxFit.contain,
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
          child: GameAppBar(),
        ),
      ],
    );
  }

  void onLeave(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CustomExitDialog();
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

  void onCreateTimer(BuildContext context) async {
    await showBottomSheet(
      context: context,
      builder: (context) {
        return CreateTimerSheet();
      },
    );
  }
}
