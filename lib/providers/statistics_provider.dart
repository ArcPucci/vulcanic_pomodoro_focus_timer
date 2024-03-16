import 'package:flutter/material.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/services/services.dart';

class StatisticsProvider extends ChangeNotifier {
  final StatisticsService _statisticsService;

  StatisticsProvider({
    required StatisticsService statisticsService,
  }) : _statisticsService = statisticsService;

  bool _firstTime = false;

  bool get firstTime => _firstTime;

  List<Statistics> _statistics = [];

  List<Statistics> get statistics => _statistics;

  List<DateTime> _dates = [];

  List<DateTime> get dates => _dates;

  Map<String, Statistics> _timerStatistics = {};

  List<Statistics> get timerStatistics => _timerStatistics.values.toList();

  Statistics _totalStatistics = Statistics.empty();

  Statistics get totalStatistics => _totalStatistics;

  Map<DateTime, List<Statistics>> _allStatistics = {};

  Map<DateTime, List<Statistics>> get allStatistics => _allStatistics;

  List<DateTime> _dateTimes = [];

  List<DateTime> get dateTimes => _dateTimes;

  bool _loading = false;

  bool get loading => _loading;

  void init() async {
    _firstTime = await _statisticsService.checkFirstTime();
    notifyListeners();
    _onUpdateStatistics();
  }

  void _onUpdateStatistics() async {
    _statistics = await _statisticsService.getStatistics(_dates);
    _onUpdate();
  }

  void _onUpdate() {
    _totalStatistics = Statistics.empty();

    _loading = true;
    notifyListeners();

    for (final item in _statistics) {
      _onUpdateStatisticsForEachTimer(item);
      _onUpdateTotalStatistics(item);
      _onUpdateAllStatistics(item);
    }

    _loading = false;
    notifyListeners();
  }

  void _onUpdateAllStatistics(Statistics statistics) {
    if (_allStatistics[statistics.dateTime] != null) {
      _allStatistics[statistics.dateTime]!.add(statistics);
    } else {
      _dateTimes.add(statistics.dateTime);
      _allStatistics[statistics.dateTime] = [statistics];
    }

    _dateTimes.sort((a, b) => b.compareTo(a));
  }

  void _onUpdateStatisticsForEachTimer(Statistics statistics) {
    if (_timerStatistics[statistics.title] == null) {
      _timerStatistics[statistics.title] = statistics;
    } else {
      final workTime = _timerStatistics[statistics.timerId]!.workTime;
      final restTime = _timerStatistics[statistics.timerId]!.restTime;
      final workRepeats = _timerStatistics[statistics.timerId]!.workRepeats;
      final restRepeats = _timerStatistics[statistics.timerId]!.restRepeats;
      _timerStatistics[statistics.title] =
          _timerStatistics[statistics.timerId]!.copyWith(
        workTime: workTime + statistics.workTime,
        restTime: restTime + statistics.restTime,
        workRepeats: workRepeats + statistics.workRepeats,
        restRepeats: restRepeats + statistics.restRepeats,
      );
    }
  }

  void _onUpdateTotalStatistics(Statistics statistics) {
    final workTime = _totalStatistics.workTime;
    final restTime = _totalStatistics.restTime;
    final workRepeats = _totalStatistics.workRepeats;
    final restRepeats = _totalStatistics.restRepeats;
    _totalStatistics = _totalStatistics.copyWith(
      workTime: workTime + statistics.workTime,
      restTime: restTime + statistics.restTime,
      workRepeats: workRepeats + statistics.workRepeats,
      restRepeats: restRepeats + statistics.restRepeats,
    );
  }

  void onCreate(Statistics statistics) async {
    await _statisticsService.onCreate(statistics);
    _onUpdateStatistics();
  }

  void onChangeRange(List<DateTime> newDates) async {
    _dates = newDates;
    await _statisticsService.getStatistics(_dates);
    _onUpdateStatistics();
  }
}
