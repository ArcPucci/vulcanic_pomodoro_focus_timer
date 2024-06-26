import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/services/preferences_service.dart';
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
            GestureDetector(
              onTap: () {
                final provider = Provider.of<PreferencesService>(
                  context,
                  listen: false,
                );

                if(provider.getPremium()) {
                  context.go('/');
                } else {
                  context.go('/premium');
                }
              },
              child: Image.asset(
                'assets/png/buttons/play.png',
                width: 170.w,
                height: 170.h,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            Transform.scale(
              scale: 1.8,
              child: Lottie.asset(
                'assets/json/standart_work.json',
                alignment: Alignment.topCenter,
                height: 230.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
