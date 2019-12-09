import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import './provider.dart';
import './index.dart';

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
      title: 'flutter',
      home: IndexPage(),
    );
  }
}
