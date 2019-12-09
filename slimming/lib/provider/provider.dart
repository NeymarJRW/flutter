import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../event/event.dart';

class Counter with ChangeNotifier {
  String _title = 'Target Clock';
  void savedata(String weight) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime date = DateTime.now(); 
    String time=date.year.toString()+'-'+date.month.toString()+'-'+(date.day-0).toString();
    //  prefs.setString(date.subtract(Duration(days:1)).toString(), weight);
    //  prefs.setString(date.toString(), weight);
    prefs.setStringList(time, [date.toString(),weight]);
    eventBus.fire(new GetWeight(weight));
  }
  void targetWeight(String weight) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('TargetWeight', weight);
     eventBus.fire(new TargetWeight(weight));
  }
  void getdata() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     DateTime date = DateTime.now(); 
     String time=date.year.toString()+'-'+date.month.toString()+'-'+date.day.toString();
     print(prefs.getString(time)) ;
  }
  get title => _title;
}
