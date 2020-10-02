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
  List<List<String>> allData;
  List<String> nameData = List<String>();
  List<String> urlData = List<String>();
  _HomePageState() {
    allData = recordData.returnProcessedData();
    if (allData != null) {
      nameData = allData[0];
      urlData = allData[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Meetings Manager")),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateAndDisplay(context);
          },
          disabledElevation: 1,
          backgroundColor: myBlue,
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: nameData != null ? nameData.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(nameData[index],
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      )),
                  subtitle: Text(urlData[index],
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      )),
                );
              },
            ))
          ],
        ));
  }

  navigateAndDisplay(BuildContext context) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewMeeting()));
    recordData.writeRecords(recordData.formatOutRecord(result));

    setState(() {
      nameData.add(result[0]);
      urlData.add(result[1]);
      print("OK");
    });
  }
}
