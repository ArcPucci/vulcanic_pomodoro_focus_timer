import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(21),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          width: 356.w,
          height: 72.h,
          decoration: BoxDecoration(
            color: AppTheme.black.withOpacity(0.94),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              tabBarItems.length,
              (index) {
                final item = tabBarItems[index];
                final selected = index == 0;
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.asset,
                        width: 24.w,
                        height: 24.h,
                        color: selected ? null : AppTheme.gray.withOpacity(0.7),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 2.h),
                      _buildText(item, selected),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(TabBarItem item, bool selected) {
    if (selected) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return AppTheme.gradient3.createShader(bounds);
        },
        child: Text(
          item.title,
          style: AppTextStyles.textStyle8.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return Text(item.title, style: AppTextStyles.textStyle8);
  }
}
