import 'package:vulcanic_pomodoro_focus_timer/models/models.dart';

final List<Volcano> volcanoes = [
  const Volcano(
    id: 0,
    premium: false,
    name: 'Standart',
    logo: 'assets/png/volcanoes/standart.png',
    workJson: 'assets/json/standart_work.json',
    restJson: 'assets/json/standart_rest.json',
  ),
  const Volcano(
    id: 1,
    premium: true,
    name: 'Angry',
    logo: 'assets/png/volcanoes/angry.png',
    workJson: 'assets/json/angry_work.json',
    restJson: 'assets/json/angry_rest.json',
  ),
  const Volcano(
    id: 2,
    premium: true,
    name: 'Pinky',
    logo: 'assets/png/volcanoes/pinky.png',
    workJson: 'assets/json/pinky_work.json',
    restJson: 'assets/json/pinky_rest.json',
  ),
];
