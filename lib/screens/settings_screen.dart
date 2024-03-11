import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Column(
      children: [
        SizedBox(height: 18.h),
        const CustomAppBar(text: 'Settings'),
        SizedBox(height: 15.h),
        const CustomButton3(
          enabled: false,
          hasToggleButton: true,
          text: 'Notifications',
        ),
        SizedBox(height: 12.h),
        const CustomButton3(text: 'Privacy Policy'),
        SizedBox(height: 12.h),
        const CustomButton3(text: 'Terms of Use'),
        SizedBox(height: 12.h),
        const CustomButton3(text: 'Support'),
        const Spacer(),
        Image.asset(
          'assets/png/fire.png',
          width: 113.sp,
          height: 113.sp,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 136.h + overlay.bottom),
      ],
    );
  }
}
