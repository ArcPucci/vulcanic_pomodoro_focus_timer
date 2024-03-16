import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/services/services.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class TimerProvider extends ChangeNotifier {
  final TimersProvider _provider;
  final StatisticsProvider _statisticsProvider;

  TimerProvider({
    required TimersProvider provider,
    required StatisticsProvider statisticsProvider,
  })  : _provider = provider,
        _statisticsProvider = statisticsProvider;

  int _seconds = 1500;

  int _overallWorkTime = 0;

  int _overallRestTime = 0;

  int get seconds => _seconds;

  int get workSeconds => timerView.workTime * 60;

  int get restSeconds => timerView.restTime * 60;

  double get percent => (_seconds / (_workTime ? workSeconds : restSeconds));

  Timer? _timer;

  int _work = 0;

  int _rest = 0;

  bool _workTime = true;

  bool get workTime => _workTime;

  bool _timerStarted = false;

  TimerView get timerView => _provider.timerView;

  bool get canReset => percent > 0;

  void init() {
    _seconds = timerView.workTime * 60;
    _workTime = true;
    _work = 0;
    _rest = 0;
  }

  void onStart() {
    _timerStarted = !_timerStarted;
    if (_timerStarted) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) {
          if (_seconds <= 0) {
            if (_workTime) {
              _work++;
              _seconds = timerView.restTime * 60;

              if (timerView.notificationEnabled)
                NotificationService().showNotification(
                  title: 'Working time is over!',
                  body: 'Time to take a break',
                );
            } else {
              _rest++;
              _seconds = timerView.workTime * 60;

              if (timerView.notificationEnabled)
                NotificationService().showNotification(
                  title: 'The rest is over!',
                  body: 'Time to work',
                );
            }
            _workTime = !_workTime;
            notifyListeners();
            return;
          }
          if (_workTime) {
            _overallWorkTime++;
          } else {
            _overallRestTime++;
          }
          _seconds--;
          notifyListeners();
        },
      );
    } else {
      onStop();
    }
  }

  void onReset() {
    if (!canReset) return;
    _timerStarted = false;
    _timer?.cancel();

    notifyListeners();
    onStart();
  }

  void onStop() {
    _timerStarted = false;
    _timer?.cancel();
  }

  void onLeave() {
    final statistics = Statistics(
      id: 0,
      timerId: timerView.id,
      title: timerView.name,
      workTime: _overallWorkTime ~/ 60,
      restTime: _overallRestTime ~/ 60,
      workRepeats: _work,
      restRepeats: _rest,
      dateTime: DateTime.now(),
      time: DateTime.now().time,
    );

    _statisticsProvider.onCreate(statistics);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
