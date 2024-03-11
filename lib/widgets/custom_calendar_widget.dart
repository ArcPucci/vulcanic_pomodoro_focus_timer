import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    Key? key,
    required this.initialDate,
    required this.onNextMonth,
    required this.onPrevMonth,
    this.firstDate,
    this.secondDate,
    required this.onChangeFirstDate,
    required this.onChangeSecondDate,
  }) : super(key: key);

  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? secondDate;
  final void Function(DateTime dateTime) onNextMonth;
  final void Function(DateTime dateTime) onPrevMonth;
  final void Function(DateTime? dateTime) onChangeFirstDate;
  final void Function(DateTime? dateTime) onChangeSecondDate;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  static const _x = 7;
  static const _y = 5;
  static const _n = 35;
  static const List<String> _shortWeekdays = <String>[
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];

  final List<DayInfo> days = [];

  final List<int> years = [for (int i = 0; i < 100; i++) 1925 + i];

  final currentDateTime = DateTime.now();

  int defaultIndex = 99;

  @override
  void initState() {
    _calculateDays();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalendarWidget oldWidget) {
    _calculateDays();
    super.didUpdateWidget(oldWidget);
  }

  void _calculateDays() {
    days.clear();
    final int year = widget.initialDate.year;
    final int month = widget.initialDate.month;

    final prevMonth = widget.initialDate.copyWith(month: month - 1).month;

    final int daysInPrevMonth = DateUtils.getDaysInMonth(year, prevMonth);
    final int daysInMonth = DateUtils.getDaysInMonth(year, month);

    final int dayOffset = DateUtils.firstDayOffset(
          year,
          month,
          const DefaultMaterialLocalizations(),
        ) -
        1;

    var n = _n;

    for (int i = 1; i <= dayOffset; i++) {
      final int id = daysInPrevMonth - dayOffset + i;
      final dateTime = DateTime(year, prevMonth, id);
      days.add(DayInfo(
        id: id,
        canSelected: false,
        isCurrentMonth: false,
        isCurrentDay: false,
        selectedDay: widget.initialDate.withZeroTime == dateTime,
      ));
      n--;
    }

    for (int i = 1; i <= daysInMonth; i++) {
      final dateTime = DateTime(year, month, i);
      days.add(
        DayInfo(
          id: i,
          canSelected: true,
          isCurrentMonth: true,
          isCurrentDay: dateTime == currentDateTime.withZeroTime,
          selectedDay: widget.initialDate.withZeroTime == dateTime,
        ),
      );
      n--;
    }
    for (int i = 1; i <= n; i++) {
      final dateTime = DateTime(year, month, i);
      days.add(DayInfo(
        id: i,
        canSelected: false,
        isCurrentMonth: false,
        isCurrentDay: false,
        selectedDay: widget.initialDate.withZeroTime == dateTime,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    int index2 = 0;
    return Container(
      width: 343.w,
      height: 370.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppTheme.bg,
        border: GradientBoxBorder(
          gradient: AppTheme.gradient5,
          width: 1.sp,
        ),
      ),
      padding: EdgeInsets.only(
        left: 30.w,
        right: 20.w,
        top: 24.h,
        bottom: 20.h,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 197.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    final initDate = widget.initialDate.withZeroTime;
                    final date =
                        widget.initialDate.copyWith(month: initDate.month - 1);
                    widget.onPrevMonth(date);
                  },
                  child: Transform.rotate(
                    angle: pi,
                    child: Image.asset(
                      'assets/png/buttons/next.png',
                      width: 30.w,
                      height: 30.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  DateFormat('MMMM y').format(widget.initialDate),
                  style: AppTextStyles.textStyle2.copyWith(
                    fontSize: 16.r,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final initDate = widget.initialDate.withZeroTime;
                    final date =
                        widget.initialDate.copyWith(month: initDate.month + 1);
                    widget.onNextMonth(date);
                  },
                  child: Image.asset(
                    'assets/png/buttons/next.png',
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              _x,
              (index) {
                return _buildWeekday(_shortWeekdays[index]);
              },
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _y,
                      (y) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          _x,
                          (x) {
                            final day = days[index++];
                            final date = widget.initialDate
                                .copyWith(day: day.id)
                                .withZeroTime;
                            final selected = (widget.firstDate?.withZeroTime ==
                                        date ||
                                    widget.secondDate?.withZeroTime == date) &&
                                (day.canSelected);
                            return Container(
                              width: 21.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: selected ? null : Colors.transparent,
                                gradient: selected ? AppTheme.gradient1 : null,
                              ),
                              alignment: Alignment.center,
                              child: day.isCurrentMonth
                                  ? Text(
                                      '${day.id}',
                                      style: AppTextStyles.textStyle2.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.r,
                                      ),
                                    )
                                  : SizedBox(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _y,
                      (y) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            _x,
                            (x) {
                              final day = days[index2++];
                              final date = widget.initialDate
                                  .copyWith(day: day.id)
                                  .withZeroTime;
                              final between = widget.firstDate != null &&
                                  widget.secondDate != null &&
                                  (widget.firstDate!.isBefore(date) &&
                                      widget.secondDate!.isAfter(date)) &&
                                  day.isCurrentMonth;
                              return GestureDetector(
                                onTap: () {
                                  if (!day.canSelected) return;
                                  if (widget.secondDate != null ||
                                      widget.firstDate == null) {
                                    widget.onChangeFirstDate(date);
                                    widget.onChangeSecondDate(null);
                                    return;
                                  }
                                  widget.onChangeSecondDate(date);
                                },
                                child: Container(
                                  width: 21.w,
                                  height: 20.h,
                                  color: Colors.transparent,
                                  alignment: Alignment.center,
                                  // child: Container(
                                  //   color: between
                                  //       ? AppTheme.purple.withOpacity(0.31)
                                  //       : null,
                                  //   height: 14.r,
                                  // ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 6.w),
              SizedBox(width: 167.w),
              Spacer(),
              CustomIconButton(asset: 'assets/png/icons/reset.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeekday(String shortWeekday) {
    if (shortWeekday == 'S') {
      return Container(
        width: 21.w,
        height: 20.h,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return AppTheme.gradient3.createShader(bounds);
          },
          child: Text(
            shortWeekday,
            style: AppTextStyles.textStyle2.copyWith(
              color: Colors.white,
              fontSize: 14.r,
            ),
          ),
        ),
      );
    }
    return Container(
      width: 21.w,
      height: 20.h,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Text(
        shortWeekday,
        style: AppTextStyles.textStyle2.copyWith(
          fontSize: 14.r,
        ),
      ),
    );
  }
}

class DayInfo {
  final int id;
  final bool canSelected;
  final bool isCurrentMonth;
  final bool isCurrentDay;
  final bool selectedDay;

  const DayInfo({
    required this.id,
    required this.canSelected,
    required this.isCurrentMonth,
    required this.isCurrentDay,
    required this.selectedDay,
  });
}
