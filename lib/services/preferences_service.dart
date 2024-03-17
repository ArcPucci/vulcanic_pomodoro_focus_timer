import 'package:shared_preferences/shared_preferences.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService(this._preferences);

  static const premiumKey = 'PREMIUM';
  static const notificationKey = 'NOTIFICATION';
  static const firstInitKey = 'FIRST_INIT';
  static const volcanoKey = 'VOLCANO';
  static const firstStatisticsKey = 'FIRST_STAT';

  Future<void> setPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() {
    return _preferences.getBool(premiumKey) ?? false;
  }

  Future<void> setFirstInit() async {
    await _preferences.setBool(firstInitKey, false);
  }

  bool getFirstInit() {
    return _preferences.getBool(firstInitKey) ?? true;
  }

  Future<void> setFirstStat() async {
    await _preferences.setBool(firstStatisticsKey, false);
  }

  bool getFirstStat() {
    return _preferences.getBool(firstStatisticsKey) ?? true;
  }

  Future<void> setNotification(bool enabled) async {
    await _preferences.setBool(notificationKey, enabled);
  }

  bool getNotification() {
    return _preferences.getBool(notificationKey) ?? false;
  }

  Future<void> setVolcano(Volcano volcano) async {
    await _preferences.setInt(volcanoKey, volcano.id);
  }

  Volcano getVolcano() {
    final id = _preferences.getInt(volcanoKey) ?? 0;
    final volcano = volcanoes.firstWhere((e) => e.id == id);
    return volcano;
  }
}
