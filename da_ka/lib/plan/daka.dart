import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttertoast/fluttertoast.dart';

class DakaPage extends StatefulWidget {
  DakaPage({Key key, this.item}) : super(key: key);
  List item;

  _DakaPageState createState() => _DakaPageState();
}

class _DakaPageState extends State<DakaPage> {
  _savedata(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  _deldata(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  List<DateTime> list = new List();
  List datas;
  Widget rili() {
    return CalendarCarousel<Event>(
      markedDates: list,
      markedDateShowIcon: true,
      markedDateColor: Colors.red,
      markedDateIconBorderColor: Colors.red,
      weekendTextStyle: TextStyle(
        color: Colors.orange,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      daysHaveCircularBorder: true,
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      list.add(DateTime.now());
      datas = widget.item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(datas[0]),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            tooltip: "del",
            onPressed: () {
              _deldata(datas[0]);
              Fluttertoast.showToast(
                  msg: "successfully deleted",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 20.0);
              Timer backlast = new Timer(Duration(seconds: 1), () {
                Navigator.of(context).pop('true');
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            tooltip: "edit",
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Successfully clocked today",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 20.0);

              Timer backlast = new Timer(Duration(seconds: 1), () {
                setState(() {
                  list.add(DateTime.now());
                });
              });
            },
          ),
        ],
      ),
      body: Container(
        child: rili(),
      ),
    );
  }
}
