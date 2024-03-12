import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class CreateTimerSheet extends StatefulWidget {
  const CreateTimerSheet({super.key});

  @override
  State<CreateTimerSheet> createState() => _CreateTimerSheetState();
}

class _CreateTimerSheetState extends State<CreateTimerSheet> {
  bool enabled = false;
  int workMinutes = 1;
  int restMinutes = 1;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Container(
      width: 375.w,
      height: 714.h + overlay.bottom,
      decoration: BoxDecoration(
        color: AppTheme.bg,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 28.h),
                Text(
                  'Pomodoro Timer Creation',
                  style: AppTextStyles.textStyle2.copyWith(
                    fontSize: 22.r,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Column(
                      children: [
                        CustomInput(hintText: 'Name'),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTimePicker(
                              value: workMinutes,
                              asset: 'assets/png/work.png',
                              onChanged: (int minutes) {
                                workMinutes = minutes;
                                setState(() {});
                              },
                            ),
                            CustomTimePicker(
                              value: restMinutes,
                              asset: 'assets/png/rest.png',
                              onChanged: (int minutes) {
                                restMinutes = minutes;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        CustomInput(
                          hintText: 'Notes (70 symbols max)',
                          minLines: 10,
                        ),
                        SizedBox(height: 24.h),
                        SizedBox(
                          width: 343.w,
                          child: Row(
                            children: [
                              Text(
                                'Notification:',
                                style: AppTextStyles.textStyle2.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.r,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              CustomSwitch1(
                                value: enabled,
                                onChanged: (value) {
                                  setState(() {
                                    enabled = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomButton1(
                          text: 'Create',
                          enabled: false,
                          textStyle: AppTextStyles.textStyle2.copyWith(
                            fontSize: 22.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12.w,
            top: 12.h,
            child: Container(
              width: 31.w,
              height: 31.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.gray2.withOpacity(0.73),
              ),
              child: Image.asset(
                'assets/png/icons/close.png',
                width: 11.w,
                height: 11.h,
                color: AppTheme.darkBlue,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
