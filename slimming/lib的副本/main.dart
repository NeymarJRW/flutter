import 'package:flutter/material.dart';
import './home.dart';
import 'package:provider/provider.dart';
import './provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<Counter>.value(
      value: Counter(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
