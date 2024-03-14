import 'package:sqflite/sqflite.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';

const timersTable = 'timers_table';

class TimersService {
  final Database database;

  TimersService(this.database);

  Future<TimerView> createTimer(TimerView timerView) async {
    final map = timerView.toMap();
    map['id'] = null;
    final id = await database.insert(timersTable, map);
    return timerView.copyWith(id: id);
  }

  Future<TimerView> updateTimer(TimerView timerView) async {
    final map = timerView.toMap();
    final id = await database.update(
      timersTable,
      map,
      where: 'id = ?',
      whereArgs: [timerView.id],
    );
    return timerView.copyWith(id: id);
  }

  Future<List<TimerView>> getTimers() async {
    final map = await database.query(timersTable) ?? [];
    if (map.isEmpty) return [];

    final timers = map.map(TimerView.fromMap).toList();
    return timers;
  }

  Future<void> deleteTimer(TimerView timerView) async {
    await database.delete(
      timersTable,
      where: 'id = ?',
      whereArgs: [timerView.id],
    );
  }
}
