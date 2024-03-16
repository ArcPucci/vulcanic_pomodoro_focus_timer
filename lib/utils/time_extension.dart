extension timeExtension on int {
  String get hoursAndMinutes =>
      '${this ~/ 60}h ${(this % 60).toString().padLeft(2, '0')}m';
  String get minutesAndSeconds =>
      '${(this ~/ 60).toString().padLeft(2, '0')}:${(this % 60).toString().padLeft(2, '0')}';
}
