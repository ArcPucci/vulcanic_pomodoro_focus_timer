import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    super.key,
    required this.asset,
    required this.onChanged,
    required this.value,
  });

  final String asset;
  final int value;
  final void Function(int minutes) onChanged;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late FixedExtentScrollController controller;

  @override
  void initState() {
    super.initState();
    int index = widget.value;
    if (index == 0) {
      index = 60;
    } else {
      index--;
    }
    controller = FixedExtentScrollController(initialItem: index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144.w,
      height: 162.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: GradientBoxBorder(
          gradient: AppTheme.gradient5,
          width: 1.sp,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            widget.asset,
            width: 32.w,
            height: 32.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 20.w),
          Container(
            width: 32.w,
            height: 146.h,
            color: Colors.transparent,
            child: CupertinoPicker(
              scrollController: controller,
              itemExtent: 38.h,
              diameterRatio: 999,
              squeeze: 1.2,
              looping: true,
              selectionOverlay: SizedBox(),
              onSelectedItemChanged: (value) => widget.onChanged(value + 1),
              children: List.generate(
                60,
                (index) {
                  return Center(
                    child: _buildText(index),
                  );
                },
              ),
            ),
          ),
          Spacer(),
          Text(
            'min',
            style: AppTextStyles.textStyle3.copyWith(
              fontSize: 20.r,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(int index) {
    if (index + 1 == widget.value)
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return AppTheme.gradient1.createShader(bounds);
        },
        child: Text(
          '${index + 1}',
          style: AppTextStyles.textStyle9,
        ),
      );

    if (max(widget.value, index + 1) - min(widget.value, index + 1) == 1 ||
        index == 59 ||
        index == 0)
      return Text(
        '${index + 1}',
        style: AppTextStyles.textStyle7.copyWith(
          fontWeight: FontWeight.w400,
          color: AppTheme.gray2.withOpacity(0.73),
        ),
      );

    return Text(
      '${index + 1}',
      style: AppTextStyles.textStyle8.copyWith(
        color: AppTheme.black.withOpacity(0.94),
      ),
    );
  }
}
