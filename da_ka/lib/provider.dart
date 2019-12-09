// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  // int _count;
  ThemeData _themedata = ThemeData.fallback();
  Color _daycolor = Colors.blue;
  Color _nightcolor = Colors.grey;
  String _title = 'Target Clock';
  void toggle() {
    if (_themedata == ThemeData.dark()) {
      _themedata = ThemeData.light();
    } else {
      _themedata = ThemeData.dark();
    }
  }
  void nightchange() {
      _daycolor = Colors.grey;
      _nightcolor = Colors.blue;
  
  }

  void daychange() {

      _nightcolor = Colors.grey;
      _daycolor = Colors.blue;

  }


  get themedata => _themedata;
  get title => _title;
  get daycolor => _daycolor;
  get nightcolor => _nightcolor;
}
