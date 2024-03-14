import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/services/services.dart';

class TimersProvider extends ChangeNotifier {
  final TimersService _service;
  final GoRouter _router;

  TimersProvider({
    required TimersService service,
    required PreferencesService preferencesService,
    required GoRouter router,
  })  : _service = service,
        _router = router;

  List<TimerView> _timers = [];

  List<TimerView> get timers => _timers;

  TimerView _timerView = TimerView.empty();

  TimerView get timerView => _timerView;

  void init() async {
    _timers = await _service.getTimers();
    notifyListeners();
  }

  void onChangeTimer(TimerView timerView) {
    _timerView = timerView;
  }

  void onSelectTimer(TimerView timerView) {
    _timerView = timerView;
    _router.go('/timer');
  }

  void onCreateTimer(TimerView timerView) async {
    await _service.createTimer(timerView);

    _timers = await _service.getTimers();
    notifyListeners();
  }

  void onDeleteTimer(TimerView timerView) async {
    await _service.deleteTimer(timerView);

    _timers = await _service.getTimers();
    notifyListeners();
  }

  void onEditTimer(TimerView timerView) async {
    _timerView = timerView;
    await _service.updateTimer(timerView);

    _timers = await _service.getTimers();
    notifyListeners();
  }
}
