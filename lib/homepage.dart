import 'package:MeetingsManager/main.dart';
import 'package:MeetingsManager/newmeeting.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Meetings Manager")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewMeeting()));
        },
        backgroundColor: myBlue,
        child: Icon(Icons.add),
      ),
    );
  }
}
