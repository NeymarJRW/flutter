import 'package:flutter/material.dart';
import './start/start.dart';
import './pages/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
        '/home': (BuildContext context) => new HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

