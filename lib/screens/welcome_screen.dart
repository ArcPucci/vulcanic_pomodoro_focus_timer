import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Opacity(
              opacity: 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 171.5.w,
                    height: 55.h,
                    alignment: Alignment.center,
                    child: Text(
                      'Terms of Use',
                      style: AppTextStyles.textStyle3,
                    ),
                  ),
                  Container(
                    width: 171.5.w,
                    height: 55.h,
                    alignment: Alignment.center,
                    child: Text(
                      'Privacy Policy',
                      style: AppTextStyles.textStyle3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return AppTheme.gradient1.createShader(bounds);
              },
              child: Text(
                'Welcome',
                style: AppTextStyles.textStyle1.copyWith(
                  fontSize: 46.r,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Volcanic: Pomodoro\nFocus Timer',
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle4,
            ),
            SizedBox(height: 72.h),
            Container(
              width: 170.r,
              height: 170.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.gradient1,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 6.w),
              child: Image.asset(
                'assets/png/play.png',
                width: 54.w,
                height: 57.h,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/png/logo2.png',
              height: 230.h,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}
