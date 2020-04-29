import 'package:flutter/material.dart';

import 'screens/landing_page.dart';

void main() => runApp(SleepTracker());

class SleepTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}
