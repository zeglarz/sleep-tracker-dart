import 'package:flutter/material.dart';
import 'package:sleeptracker/components/main_button.dart';

class AddSleepPage extends StatelessWidget {
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
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset('images/baby.jpg'),
              ),
            ),
            MainButton(
              title: 'Save',
              onTap: () => Navigator.pop(context),
            )
          ],
        ));
  }
}
