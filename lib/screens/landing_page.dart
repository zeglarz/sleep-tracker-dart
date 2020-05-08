import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sleeptracker/components/main_button.dart';
import 'package:sleeptracker/components/sleep.dart';
import 'package:sleeptracker/components/sleep_record_widget.dart';

import 'add_sleep_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage(this.sleepRecords);
  List<Sleep> sleepRecords;

  String currDate =
      DateFormat("EEEE, d MMM yyyy").format(DateTime.now()).toUpperCase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Tracker'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.amber, Colors.orange],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              child: Icon(
                FontAwesomeIcons.moon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 15),
              child: Text(
                'Get to know your baby\'s sleep patterns and keep \n track of how much sleep they are getting here.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          MainButton(
            title: 'Add new sleeping record',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddSleepPage())),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text('$currDate',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Container(
              child: ListView(
                children: sleepRecords
                    .map((item) => SleepRecordWidget(
                        sleepTime: item.time,
                        sleepType: item.category,
                        sleepDuration: item.length))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
