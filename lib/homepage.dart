import 'package:MeetingsManager/main.dart';
import 'package:MeetingsManager/newmeeting.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Records.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Records recordData = Records();
  var allData = recordData.formatOutRecord(recordData.readRecords());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Meetings Manager")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewMeeting()));
        },
        disabledElevation: 1,
        backgroundColor: myBlue,
        child: Icon(Icons.add),
      ),
    );
  }
}
