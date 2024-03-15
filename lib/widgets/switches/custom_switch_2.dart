import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomSwitch2 extends StatelessWidget {
  const CustomSwitch2({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 180.w,
        height: 32.h,
        child: Stack(
          alignment: value ? Alignment.centerLeft : Alignment.centerRight,
          children: [
            Container(
              width: 90.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                gradient: AppTheme.gradient1,
              ),
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90.w,
                    height: 32.h,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Date',
                      style: AppTextStyles.textStyle2.copyWith(
                        color: value ? null : AppTheme.gray2.withOpacity(0.73),
                        fontSize: 16.r,
                      ),
                    ),
                  ),
                  Container(
                    width: 90.w,
                    height: 32.h,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Month',
                      style: AppTextStyles.textStyle2.copyWith(
                        color: value ? AppTheme.gray2.withOpacity(0.73) : null,
                        fontSize: 16.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
