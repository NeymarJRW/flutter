import 'package:flutter/material.dart';
class ThemePage extends StatefulWidget {
  ThemePage({Key key}) : super(key: key);

  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
        leading: Text(''),
      ),

    );
  }
}