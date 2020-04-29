import 'package:sleeptracker/components/sleep.dart';

class SleepTracker {
  List<Sleep> _sleepTracker = [
    Sleep(time: '10:11 AM', category: 'Nap', length: '2 hours 12 min'),
    Sleep(
        time: '14:11 AM', category: 'Niht\'s sleep', length: '6 hours 12 min'),
  ];

  void addSleep(sleep) => _sleepTracker.add(sleep);

  List<Sleep> getSleepItems() {
    return _sleepTracker;
  }
}
