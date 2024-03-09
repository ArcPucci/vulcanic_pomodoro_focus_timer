import 'package:flutter/material.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
