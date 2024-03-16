import 'package:vulcanic_pomodoro_focus_timer/utils/datetime_extension.dart';

class Statistics {
  final int id;
  final int timerId;
  final String title;
  final int workTime;
  final int restTime;
  final int workRepeats;
  final int restRepeats;
  final DateTime dateTime;
  final String time;

  const Statistics({
    required this.id,
    required this.timerId,
    required this.title,
    required this.workTime,
    required this.restTime,
    required this.workRepeats,
    required this.restRepeats,
    required this.dateTime,
    required this.time,
  });

  factory Statistics.empty() => Statistics(
        id: -1,
        timerId: -1,
        title: '',
        workTime: 0,
        restTime: 0,
        workRepeats: 0,
        restRepeats: 0,
        dateTime: DateTime.now().withZeroTime,
        time: '',
      );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'timer_id': this.timerId,
      'title': this.title,
      'work_time': this.workTime,
      'rest_time': this.restTime,
      'work_repeats': this.workRepeats,
      'rest_repeats': this.restRepeats,
      'time': this.time,
      'date_time': this.dateTime.withZeroTime.microsecondsSinceEpoch,
    };
  }

  factory Statistics.fromMap(Map<String, dynamic> map) {
    return Statistics(
      id: map['id'] as int,
      timerId: map['timer_id'] as int,
      title: map['title'] as String,
      workTime: map['work_time'] as int,
      restTime: map['rest_time'] as int,
      workRepeats: map['work_repeats'] as int,
      restRepeats: map['rest_repeats'] as int,
      time: map['time'] as String,
      dateTime: DateTime.fromMicrosecondsSinceEpoch(map['date_time'] as int),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Statistics &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          timerId == other.timerId &&
          title == other.title &&
          workTime == other.workTime &&
          restTime == other.restTime &&
          workRepeats == other.workRepeats &&
          restRepeats == other.restRepeats &&
          dateTime == other.dateTime &&
          time == other.time;

  @override
  int get hashCode =>
      id.hashCode ^
      timerId.hashCode ^
      title.hashCode ^
      workTime.hashCode ^
      restTime.hashCode ^
      workRepeats.hashCode ^
      restRepeats.hashCode ^
      dateTime.hashCode ^
      time.hashCode;

  Statistics copyWith({
    int? id,
    int? timerId,
    String? title,
    int? workTime,
    int? restTime,
    int? workRepeats,
    int? restRepeats,
    DateTime? dateTime,
    String? time,
  }) {
    return Statistics(
      id: id ?? this.id,
      timerId: timerId ?? this.timerId,
      title: title ?? this.title,
      workTime: workTime ?? this.workTime,
      restTime: restTime ?? this.restTime,
      workRepeats: workRepeats ?? this.workRepeats,
      restRepeats: restRepeats ?? this.restRepeats,
      dateTime: dateTime ?? this.dateTime,
      time: time ?? this.time,
    );
  }
}
