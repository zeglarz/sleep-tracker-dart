import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({this.title, this.onTap});
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.blue.shade400, Colors.blue.shade900],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
            child: Text(
          '$title',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
