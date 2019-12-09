import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Color(0xff232d37),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.keyboard_arrow_left,size: 40,color: Colors.white,),
                )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Theme(
            data: new ThemeData(
              accentColor:Colors.blue,
            primaryColor: Colors.white, hintColor: Colors.black54),
            child: TextField(
              keyboardType:TextInputType.number,
               style: TextStyle(color: Colors.white),
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.local_airport),
                  hintText: 'data',
                  // contentPadding: new EdgeInsets.all(0.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15.0),
                  )),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Theme(
            data: new ThemeData(
            
            primaryColor: Colors.white, hintColor: Colors.black54),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _controller,
              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.local_airport),
                  hintText: 'data',
                  // contentPadding: new EdgeInsets.all(0.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15.0),
                  )),
            ),
          )
        ],
      ),
    )));
  }
}
