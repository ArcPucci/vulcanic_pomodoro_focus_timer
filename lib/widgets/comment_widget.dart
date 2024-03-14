import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 343.w,
          height: 258.h,
          decoration: BoxDecoration(
            color: AppTheme.bg,
            borderRadius: BorderRadius.circular(15),
            border: GradientBoxBorder(
              gradient: AppTheme.gradient5,
              width: 1.sp,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Text(
              text,
              style: AppTextStyles.textStyle7.copyWith(
                fontWeight: FontWeight.w400,
                color: AppTheme.white.withOpacity(0.9),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: 335.w,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: Image.asset(
              'assets/png/buttons/comments_2.png',
              width: 45.w,
              height: 45.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: overlay.bottom + 104.h),
      ],
    );
  }
}
