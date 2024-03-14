import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            SizedBox(height: 18.h),
            const CustomAppBar(text: 'Settings'),
            SizedBox(height: 15.h),
            CustomButton3(
              enabled: value.notificationEnabled,
              hasToggleButton: true,
              text: 'Notifications',
              onTap: value.changeNotification,
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
      },
    );
  }
}
