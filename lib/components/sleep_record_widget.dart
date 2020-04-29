import 'package:flutter/material.dart';

class SleepRecordWidget extends StatelessWidget {
  SleepRecordWidget({this.sleepTime, this.sleepDuration, this.sleepType});
  final String sleepTime;
  final String sleepType;
  final String sleepDuration;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0.5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.grey.shade300,
              child: Column(
                children: <Widget>[
                  Text(sleepTime.split(' ')[0],
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(sleepTime.split(' ')[1],
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w200)),
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
                Text(sleepType,
                    style: TextStyle(
                        letterSpacing: 1.3,
                        fontSize: 16.0,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(sleepDuration,
                    style: TextStyle(
                        letterSpacing: 1.3,
                        fontSize: 14.0,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
