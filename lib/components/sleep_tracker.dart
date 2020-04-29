import 'package:sleeptracker/components/sleep.dart';

class SleepRecords {
  List<Sleep> _sleepTracker = [
    Sleep(time: '10:11 AM', category: 'Nap', length: '2 hours 12 min'),
    Sleep(
        time: '14:11 AM', category: 'Night\'s sleep', length: '6 hours 12 min'),
    Sleep(
        time: '14:11 AM', category: 'Night\'s sleep', length: '6 hours 12 min'),
    Sleep(
        time: '14:11 AM', category: 'Night\'s sleep', length: '6 hours 12 min'),
  ];

  void addSleep(Sleep sleep) {
    print('jestem tu');
    _sleepTracker.add(sleep);
    int lng = _sleepTracker.length;
    print('lenght is $lng');
  }

  List<Sleep> getSleepItems() {
    return _sleepTracker;
  }
}
