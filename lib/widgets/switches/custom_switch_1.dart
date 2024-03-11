import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomSwitch1 extends StatelessWidget {
  const CustomSwitch1({
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
        width: 114.w,
        height: 42.h,
        child: Stack(
          alignment:
              value ? Alignment.centerLeft : Alignment.centerRight,
          children: [
            Container(
              width: 57.w,
              height: 42.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                color: value ? null : AppTheme.red.withOpacity(0.74),
                gradient: value ? AppTheme.gradient1 : null,
              ),
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 57.w,
                    height: 42.h,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Yes',
                      style: AppTextStyles.textStyle2.copyWith(
                        color: value
                            ? null
                            : AppTheme.gray2.withOpacity(0.73),
                        fontSize: 18.r,
                      ),
                    ),
                  ),
                  Container(
                    width: 57.w,
                    height: 42.h,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'No',
                      style: AppTextStyles.textStyle2.copyWith(
                        color: value
                            ? AppTheme.gray2.withOpacity(0.73)
                            : null,
                        fontSize: 18.r,
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
