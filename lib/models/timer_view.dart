class TimerView {
  final int id;
  final String name;
  final int workTime;
  final int restTime;
  final String comment;
  final bool notificationEnabled;

  const TimerView({
    required this.id,
    required this.name,
    required this.workTime,
    required this.restTime,
    required this.comment,
    required this.notificationEnabled,
  });

  factory TimerView.empty() => TimerView(
        id: -1,
        name: '',
        workTime: 10,
        restTime: 5,
        comment: '',
        notificationEnabled: false,
      );

  TimerView copyWith({
    int? id,
    String? name,
    int? workTime,
    int? restTime,
    String? comment,
    bool? notificationEnabled,
  }) {
    return TimerView(
      id: id ?? this.id,
      name: name ?? this.name,
      workTime: workTime ?? this.workTime,
      restTime: restTime ?? this.restTime,
      comment: comment ?? this.comment,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'work_time': this.workTime,
      'rest_time': this.restTime,
      'comment': this.comment,
      'notification_enabled': this.notificationEnabled ? 1 : 0,
    };
  }

  factory TimerView.fromMap(Map<String, dynamic> map) {
    return TimerView(
      id: map['id'] as int,
      name: map['name'] as String,
      workTime: map['work_time'] as int,
      restTime: map['rest_time'] as int,
      comment: map['comment'] as String,
      notificationEnabled: (map['notification_enabled'] as int) == 1,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerView &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          workTime == other.workTime &&
          restTime == other.restTime &&
          comment == other.comment &&
          notificationEnabled == other.notificationEnabled;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      workTime.hashCode ^
      restTime.hashCode ^
      comment.hashCode ^
      notificationEnabled.hashCode;
}
