import 'package:flutter/material.dart';
// import './index/idnex.dart';
import 'package:provider/provider.dart';
import './provider.dart';
import './startPage/start.dart';
// import './startPage/start.dart';

void main() => runApp(
  ChangeNotifierProvider<Counter>.value(
      value: Counter(),
      child: MyApp(),
    ));

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      home: SplashRoute(),
    );
  }
}


