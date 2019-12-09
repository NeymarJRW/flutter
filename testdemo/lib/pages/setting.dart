import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../event.dart';
import '../provider.dart';
class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
        child:CupertinoButton(
            child: Text("按钮",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            // disabledColor: Colors.blue,
            color: Colors.blue,
            onPressed: (){},
//            onPressed: null,
            pressedOpacity: 0.9,
          ),
        ));
  }
}