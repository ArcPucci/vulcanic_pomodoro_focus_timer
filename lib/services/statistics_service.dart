import 'package:sqflite/sqflite.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/datetime_extension.dart';

const statisticsTable = 'statistics_table';

class StatisticsService {
  final Database database;

  StatisticsService(this.database);

  Future<Statistics> onCreate(Statistics statistics) async {
    final map = statistics.toMap();
    map['id'] = null;
    final id = await database.insert(statisticsTable, map);
    return statistics.copyWith(id: id);
  }

  Future<void> onDelete(Statistics statistics) async {
    await database.delete(
      statisticsTable,
      where: 'id = ?',
      whereArgs: [statistics.id],
    );
  }

  Future<bool> checkFirstTime() async {
    final map = await database.query(statisticsTable);
    if (map.isEmpty) return true;
    return false;
  }

  Future<List<Statistics>> getStatistics(List<DateTime> dates) async {
    final List<Map<String, Object?>> map;
    if (dates.isNotEmpty) {
      final date1 = dates.first.withZeroTime.microsecondsSinceEpoch;
      final date2 = dates.last.withZeroTime.microsecondsSinceEpoch;

      map = await database.query(
        statisticsTable,
        where: 'date_time >= ? AND date_time <= ?',
        whereArgs: [date1, date2],
      );
    } else {
      map = await database.query(statisticsTable);
    }

    if (map.isEmpty) return [];

    final List<Statistics> list =
        map.map((e) => Statistics.fromMap(e)).toList();

    return list;
  }
}
