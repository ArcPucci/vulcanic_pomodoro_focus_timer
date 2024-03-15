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
  }) : super(key: key);

  final DateTime initialDate;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime initDate = DateTime.now().withZeroTime;

  List<DateTime> _dates = [];

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
    super.initState();
    initDate = widget.initialDate.withZeroTime;
    _calculateDays();
  }

  @override
  void didUpdateWidget(covariant CalendarWidget oldWidget) {
    _calculateDays();
    super.didUpdateWidget(oldWidget);
  }

  void _calculateDays() {
    days.clear();
    final int year = initDate.year;
    final int month = initDate.month;

    final prevMonth = initDate.copyWith(month: month - 1).month;

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
        selectedDay: initDate.withZeroTime == dateTime,
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
          selectedDay: initDate.withZeroTime == dateTime,
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
        selectedDay: initDate.withZeroTime == dateTime,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    int index2 = 0;
    int index3 = 0;
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
                    final prevMonth = initDate.month - 1;
                    initDate = initDate.copyWith(month: prevMonth);
                    _calculateDays();
                    setState(() {});
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
                  DateFormat('MMMM y').format(initDate),
                  style: AppTextStyles.textStyle2.copyWith(
                    fontSize: 16.r,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final nextMonth = initDate.month + 1;
                    initDate = initDate.copyWith(month: nextMonth);
                    _calculateDays();
                    setState(() {});
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
                            final date = initDate.copyWith(day: day.id);
                            final selected =
                                _dates.contains(date) && day.isCurrentMonth;
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
                              final date = initDate.copyWith(day: day.id);
                              final between =
                                  isBetween(date) && day.isCurrentMonth;
                              final isFirstDate =
                                  firstDate(date) && day.isCurrentMonth;
                              final isSecondDate =
                                  secondDate(date) && day.isCurrentMonth;
                              return GestureDetector(
                                onTap: () {
                                  if (_dates.length == 2) {
                                    _dates.clear();
                                    setState(() {});
                                  }
                                  if (_dates.contains(date)) return;
                                  _dates.add(date);
                                  _dates.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Container(
                                  width: 291.w / 7,
                                  height: 20.h,
                                  color: Colors.transparent,
                                  alignment: isFirstDate
                                      ? Alignment.centerRight
                                      : isSecondDate
                                          ? Alignment.centerLeft
                                          : Alignment.center,
                                  child: Container(
                                    width: (isSecondDate)
                                        ? ((291.w / 7) - 0.w) / 2
                                        : isFirstDate
                                            ? ((291.w / 7) - 0.w) / 2
                                            : 291.w / 7,
                                    // width: 10.w,
                                    color:
                                        (between || isFirstDate || isSecondDate)
                                            ? AppTheme.purple.withOpacity(0.31)
                                            : null,
                                    height: 14.r,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
                            final day = days[index3++];
                            final date = initDate.copyWith(day: day.id);
                            final selected =
                                _dates.contains(date) && day.isCurrentMonth;
                            return GestureDetector(
                              onTap: () {
                                if (_dates.length == 2) {
                                  _dates.clear();
                                  setState(() {});
                                }
                                if (_dates.contains(date)) return;
                                _dates.add(date);
                                _dates.sort((a, b) => a.compareTo(b));
                                setState(() {});
                              },
                              child: Container(
                                width: 21.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: selected ? null : Colors.transparent,
                                  gradient: selected ? AppTheme.gradient1 : null,
                                ),
                                alignment: Alignment.center,
                                child: selected
                                    ? Text(
                                        '${day.id}',
                                        style: AppTextStyles.textStyle2.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.r,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            );
                          },
                        ),
                      ),
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

  bool firstDate(DateTime dateTime) {
    if (_dates.length != 2) return false;
    if (_dates.first.isAtSameMomentAs(dateTime)) return true;
    return false;
  }

  bool secondDate(DateTime dateTime) {
    if (_dates.length != 2) return false;
    if (_dates.last.isAtSameMomentAs(dateTime)) return true;
    return false;
  }

  bool isBetween(DateTime dateTime) {
    if (_dates.length != 2) return false;
    if (_dates.first.isBefore(dateTime) && _dates.last.isAfter(dateTime))
      return true;
    return false;
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
