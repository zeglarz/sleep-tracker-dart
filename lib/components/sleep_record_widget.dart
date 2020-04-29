import 'package:flutter/material.dart';

class SleepRecordWidget extends StatelessWidget {
  SleepRecordWidget({this.sleepTime, this.sleepDuration, this.sleepType});
  final String sleepTime;
  final String sleepType;
  final String sleepDuration;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.grey,
              child: Column(
                children: <Widget>[
                  Text(sleepTime.split(' ')[0]),
                  Text(sleepTime.split(' ')[1]),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(sleepType),
                Text(sleepDuration),
              ],
            ),
          )
        ],
      ),
    );
  }
}
