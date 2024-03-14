import 'package:flutter/material.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/services/services.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class StoreProvider extends ChangeNotifier {
  final PreferencesService _preferencesService;

  StoreProvider({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  bool _premium = false;

  bool get premium => _premium;

  Volcano _volcano = volcanoes[0];

  Volcano get volcano => _volcano;

  bool _notificationEnabled = false;

  bool get notificationEnabled => _notificationEnabled;

  void init() {
    _premium = _preferencesService.getPremium();
    _volcano = _preferencesService.getVolcano();
    _notificationEnabled = _preferencesService.getNotification();
  }

  void onBuyPremium() async {
    _premium = true;
    await _preferencesService.setPremium();
    notifyListeners();
  }

  void changeNotification() async {
    _notificationEnabled = !_notificationEnabled;
    await _preferencesService.setNotification(_notificationEnabled);
    notifyListeners();
  }

  void onSelectVolcano(Volcano volcano) async {
    _volcano = volcano;
    await _preferencesService.setVolcano(volcano);
    notifyListeners();
  }
}
