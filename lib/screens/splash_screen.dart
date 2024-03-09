import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/png/logo.png',
            width: 170.w,
            height: 171.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8.h),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return AppTheme.gradient1.createShader(bounds);
            },
            child: Text('Volcanic', style: AppTextStyles.textStyle1),
          ),
          SizedBox(height: 6.h),
          Text('TIMER', style: AppTextStyles.textStyle2),
        ],
      ),
    );
  }
}
