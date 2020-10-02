import 'package:MeetingsManager/main.dart';
import 'package:flutter/material.dart';

class NewMeeting extends StatefulWidget {
  @override
  _NewMeetingState createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  String _name;

  String _url;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter name"),
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildUrlField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter URL"),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is required';
        }
        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        title: Text("New Meeting"),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              //at this point onSaved methods are called for the fields

              print(_name);
              print(_url);

              var details = new List();
              details[0] = _name;
              details[1] = _url;
              Navigator.pop(context, details);
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Meeting Name",
                  style: TextStyle(color: myBlue),
                ),
              ),
              _buildNameField(),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Meeting Link",
                  style: TextStyle(color: myBlue),
                ),
              ),
              _buildUrlField(),
            ],
          ),
        ),
      ),
    );
  }
}
