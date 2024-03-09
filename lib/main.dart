import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/screens/screens.dart';

void main() {
  runZonedGuarded(() {
    runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return const MyApp();
      },
    ));
  }, (error, stack) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Jost',
      ),
      home: const PremiumScreen(),
    );
  }
}
