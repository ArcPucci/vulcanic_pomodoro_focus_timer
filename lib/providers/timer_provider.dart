import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';

class TimerProvider extends ChangeNotifier {
  final TimersProvider _provider;

  int _seconds = 1500;

  TimerProvider({
    required TimersProvider provider,
  }) : _provider = provider;

  int get minutes => _seconds ~/ 60;

  int get seconds => _seconds % 60;

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
            } else {
              _rest++;
              _seconds = timerView.workTime * 60;
            }
            _workTime = !_workTime;
            notifyListeners();
            return;
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
    if(!canReset) return;
    _timerStarted = false;
    _timer?.cancel();

    notifyListeners();
    onStart();
  }

  void onStop() {
    _timerStarted = false;
    _timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
