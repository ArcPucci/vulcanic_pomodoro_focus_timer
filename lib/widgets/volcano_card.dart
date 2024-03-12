import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class VolcanoCard extends StatelessWidget {
  const VolcanoCard({
    super.key,
    required this.volcano,
    this.selected = false,
    this.onTap,
    this.premium = false,
  });

  final Volcano volcano;
  final bool selected;
  final bool premium;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343.w,
        height: 107.h,
        decoration: BoxDecoration(
          color: AppTheme.bg,
          borderRadius: BorderRadius.circular(18),
          border: GradientBoxBorder(
            gradient: AppTheme.gradient5,
            width: 1.sp,
          ),
        ),
        padding: EdgeInsets.only(left: 20.w, right: 16.w),
        child: Row(
          children: [
            Image.asset(
              volcano.logo,
              width: 70.w,
              height: 83.h,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${volcano.name} Volcano',
                    style: AppTextStyles.textStyle2.copyWith(
                      fontSize: 22.r,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildText(),
                ],
              ),
            ),
            CustomRadioButton(selected: selected),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    if (premium || !volcano.premium) {
      return Text(
        'Available',
        style: AppTextStyles.textStyle6.copyWith(
          fontWeight: FontWeight.w400,
          height: 1,
          color: AppTheme.gray2.withOpacity(0.73),
        ),
      );
    }
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return AppTheme.gradient1.createShader(bounds);
      },
      child: Text(
        'Premium',
        style: AppTextStyles.textStyle6.copyWith(height: 1),
      ),
    );
  }
}
