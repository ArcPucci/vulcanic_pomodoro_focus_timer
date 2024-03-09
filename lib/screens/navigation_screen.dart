import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return BGWidget(
      child: Stack(
        children: [
          Positioned.fill(child: SafeArea(bottom: false, child: child)),
          Positioned(
            bottom: 8.h + overlay.bottom,
            left: 0,
            right: 0,
            child: const Center(child: CustomBottomBar()),
          ),
        ],
      ),
    );
  }
}
