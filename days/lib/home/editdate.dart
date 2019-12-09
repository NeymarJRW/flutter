import 'dart:async';
import '../global_config.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPage extends StatefulWidget {
  EditPage({Key key, this.item}) : super(key: key);
  List item;

  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String oldtitle;
  String datetitle;
  String datetime;
  String typevalue;
  bool repeat = false;

  void _textFieldChanged(String str) {
    setState(() {
      datetitle = str;
    });
  }

  List<DropdownMenuItem> dropListData() {
    List<DropdownMenuItem> items = new List();
    DropdownMenuItem dropdownMenuItem1 = new DropdownMenuItem(
      child: new Text('festival'),
      value: 'festival',
    );
    items.add(dropdownMenuItem1);
    DropdownMenuItem dropdownMenuItem2 = new DropdownMenuItem(
      child: new Text('work'),
      value: 'work',
    );
    items.add(dropdownMenuItem2);
    DropdownMenuItem dropdownMenuItem3 = new DropdownMenuItem(
      child: new Text('entertainment'),
      value: 'entertainment',
    );
    items.add(dropdownMenuItem3);
    DropdownMenuItem dropdownMenuItem4 = new DropdownMenuItem(
      child: new Text('Social contact'),
      value: 'Social',
    );
    items.add(dropdownMenuItem4);
    DropdownMenuItem dropdownMenuItem5 = new DropdownMenuItem(
      child: new Text('Other'),
      value: 'Other',
    );
    items.add(dropdownMenuItem5);
    return items;
  }

  TextEditingController phoneController;
  void initState() {
    super.initState();
    print(widget.item);
    List list = widget.item;
    phoneController=TextEditingController.fromValue(TextEditingValue(text: list[0]));
    setState(() {
      oldtitle=list[0];
      datetitle = list[0];
      datetime = list[1];
      typevalue = list[2];
      repeat=list[3]=='true' ? true : false;
    });
  }
    _editdata(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(oldtitle);
    prefs.setStringList(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'title',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(10.0),
                        labelText: 'Please enter the title',
                      ),
                      onChanged: _textFieldChanged,
                      autofocus: false,
                    ),
                    flex: 6,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: MaterialButton(
                      child: new Text(datetime == null ? 'Choose a date' : datetime),
                      onPressed: () {
                        // 调用函数打开
                        showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime.now()
                              .subtract(new Duration(days: 1)), // 减 30 天
                          lastDate: new DateTime.now()
                              .add(new Duration(days: 365 * 3)),
                        ).then((DateTime val) {
                          // 2018-07-12 00:00:00.000
                          setState(() {
                            datetime = '${val.year}-${val.month}-${val.day}';
                          });
                        }).catchError((err) {
                          print(err);
                        });
                      },
                    ),
                    flex: 6,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'type',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Center(
                      child: DropdownButton(
                        items: dropListData(),
                        hint: Text('To choose'),
                        value: typevalue,
                        onChanged: (T) {
                          //下拉菜单item点击之后的回调
                          setState(() {
                            typevalue = T;
                          });
                        },
                      ),
                    ),
                    flex: 6,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'repeat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Center(
                      child: Switch(
                        value: repeat,
                        activeColor: Colors.blue,
                        onChanged: (bool val) {
                          setState(() {
                            repeat = val;
                          });
                        },
                      ),
                    ),
                    flex: 6,
                  )
                ],
              ),
                       MaterialButton(
            elevation: 10.0, //按钮下面的阴影
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Edit'),
            onPressed: () {
              if (datetitle != null && datetime != null && typevalue != null) {
                List<String> list = new List();
                list.add(datetitle);
                list.add(datetime);
                list.add(typevalue);
                list.add(repeat.toString());
                print(list);
                _editdata(datetitle, list);
                Fluttertoast.showToast(
                    msg: "Added Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 20.0);
                    GlobalConfig.title=datetitle;
                Timer backlast = new Timer(Duration(seconds: 1), () {
                    // Navigator.of(context).pushNamed('/home');
                    Navigator.pushNamed(context, '/home');

                });
              } else {
                Fluttertoast.showToast(
                    msg: "Incomplete information",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 20.0);
              }

              // Timer backlast=new Timer(Duration(seconds: 1),(){
              // });
            },
          )
            ],
          ),
        ));
  }
}
