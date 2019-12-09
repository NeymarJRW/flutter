import 'package:flutter/material.dart';

// import 'dart:math' as math;
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> _getlist(int number){

    List<Widget> widgetlist=new List();
      print('ssss');

    for(int i=0;i<number;i++){
      print(i);
      print('ssss');
      widgetlist.add(
        Container(
          height: 130,
          color: Colors.blue,
          child: Image.asset('images/person/${i+1}.png'),
        )
      );
    }
    return widgetlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
          elevation: 0,
        ),
        body:Container(
          color: Colors.blue,
          child: GridView.count(
            crossAxisCount: 3,
            // children:_getlist(30),
            children: _getlist(30)
          ),
        )
    );
  }
}
