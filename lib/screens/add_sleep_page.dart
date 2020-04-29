import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sleeptracker/components/main_button.dart';
import 'package:sleeptracker/components/sleep.dart';
import 'package:sleeptracker/components/sleep_tracker.dart';
import 'package:sleeptracker/constants.dart';
import 'package:sleeptracker/screens/landing_page.dart';

class AddSleepPage extends StatefulWidget {
  @override
  _AddSleepPageState createState() => _AddSleepPageState();
}

SleepRecords tracker = SleepRecords();
List<Sleep> sleepRecords = tracker.getSleepItems();

class _AddSleepPageState extends State<AddSleepPage> {
  final TextEditingController _dateController = new TextEditingController();
  String currDate =
      DateFormat("d MMMM yyyy, H:mm").format(DateTime.now()).toUpperCase();
  final TextEditingController _lastNameController = new TextEditingController();

  final String getUsTime = DateFormat.jm().format(DateTime.now()).toUpperCase();

  showDialog(context) {
    Alert(
        context: context,
        title: 'Fields empty',
        type: AlertType.warning,
        desc: 'Please make sure you filled all neccessary sleep details',
        buttons: [
          DialogButton(
            child: Text(
              "Dismiss",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
          ),
        ],
        style: AlertStyle(
          titleStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.red, fontSize: 32.0),
          descStyle: TextStyle(fontWeight: FontWeight.w200),
        )).show();
  }

  int _hours;
  int _minutes;
  String sleepType;

  showPickerArray(BuildContext context) {
    new Picker(
        adapter:
            PickerDataAdapter<String>(pickerdata: pickerData, isArray: true),
        hideHeader: true,
        title: Column(
          children: <Widget>[
            Text("How long have your child slept?"),
            SizedBox(height: 30),
            Text("Hours               Minutes"),
          ],
        ),
        onConfirm: (Picker picker, List value) {
          _hours = int.parse(picker.getSelectedValues()[0]);
          _minutes = int.parse(picker.getSelectedValues()[1]);
        }).showDialog(context);
  }

  @override
  void initState() {
    _dateController.text = currDate;
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_hours);
    print(sleepType);

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
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset('images/baby.jpg'),
              ),
            ),
            Container(
              child: TextField(
                enabled: false,
                controller: _dateController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Date and time',
                ),
              ),
            ),
            DropdownButtonFormField(
              onChanged: (value) {
                setState(() => sleepType = value);
              },
              items: dropdownItems
                  .map((value) =>
                      DropdownMenuItem(child: Text(value), value: value))
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Sleep Type',
              ),
            ),
            Center(
                child: GestureDetector(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Sleep duration',
                ),
              ),
              onTap: () {
                showPickerArray(context);
              },
            )),
            MainButton(
              title: 'Save',
              onTap: () {
                String sleepDuration = _hours != null && _minutes != null
                    ? '$_hours hours $_minutes min'
                    : null;
                if (sleepDuration != null && sleepType != null) {
                  tracker.addSleep(
                    Sleep(
                      length: sleepDuration.toString(),
                      time: getUsTime,
                      category: sleepType,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingPage(sleepRecords),
                    ),
                  );
                } else {
                  showDialog(context);
                }
              },
            )
          ],
        ));
  }
}
