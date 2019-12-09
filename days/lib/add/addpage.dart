import 'dart:async';
import 'package:days/global_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  _savedata(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  DateTime initialDate = DateTime.now();

  void showDefaultYearPicker(BuildContext context) async {
    final DateTime dateTime = await showDatePicker(
      context: context,
      //定义控件打开时默认选择日期
      initialDate: initialDate,
      //定义控件最早可以选择的日期
      firstDate: DateTime(2018, 1),
      //定义控件最晚可以选择的日期
      lastDate: DateTime(2022, 1),
      builder: (BuildContext context, Widget child) {
        return Theme(
          child: child,
          data: null,
        );
      },
    );
    if (dateTime != null && dateTime != initialDate) {}
  }

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

  TextEditingController phoneController = TextEditingController();
  String datetitle;
  String datetime;
  String typevalue;
  bool repeat = false;

  Widget getadddata() {
    return
   Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'title',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                flex: 2,
              ),
              Expanded(
                child: MaterialButton(
                  child:
                      new Text(datetime == null ? 'Choose a date' : datetime),
                  onPressed: () {
                    // 调用函数打开
                    showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime.now()
                          .subtract(new Duration(days: 1)), // 减 30 天
                      lastDate:
                          new DateTime.now().add(new Duration(days: 365 * 3)),
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
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'repeat',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
          SizedBox(height: 20,),
FlatButton(
  onPressed: (){
 if (datetitle != null && datetime != null && typevalue != null) {
                List<String> list = new List();
                list.add(datetitle);
                list.add(datetime);
                list.add(typevalue);
                list.add(repeat.toString());
                _savedata(datetitle, list);
                Fluttertoast.showToast(
                    msg: "Added Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 20.0);
                Timer backlast = new Timer(Duration(seconds: 1), () {
                   Navigator.pushNamed(context, '/home');
                  // phoneController.clear();
                  // setState(() {
                  //   datetitle = null;
                  //   datetime = null;
                  //   typevalue = null;
                  //   repeat = false;
                  // });
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
  },
  child: Container(
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(5.0, 5.0),    blurRadius: 10.0, spreadRadius: 2.0), BoxShadow(color: Color(0x9900FF00), offset: Offset(1.0, 1.0)), BoxShadow(color: Color(0xFF0000FF))],
      color: Colors.blue,
      borderRadius: BorderRadius.circular(15.0)
    ),
    // color: Colors.blue,
    width: double.infinity,
    height: 40,
    child: Center(
      child: Text('add',style: TextStyle(color: Colors.white,fontSize: 20),),
    ),
  ),
),

          // MaterialButton(
          //   elevation: 10.0, //按钮下面的阴影
          //   color: Colors.blue,
          //   textColor: Colors.white,
          //   child: Text('Add'),
          //   onPressed: () {
          //     if (datetitle != null && datetime != null && typevalue != null) {
          //       List<String> list = new List();
          //       list.add(datetitle);
          //       list.add(datetime);
          //       list.add(typevalue);
          //       list.add(repeat.toString());
          //       _savedata(datetitle, list);
          //       Fluttertoast.showToast(
          //           msg: "Added Successfully",
          //           toastLength: Toast.LENGTH_SHORT,
          //           gravity: ToastGravity.CENTER,
          //           timeInSecForIos: 1,
          //           backgroundColor: Colors.black,
          //           textColor: Colors.white,
          //           fontSize: 20.0);
          //       Timer backlast = new Timer(Duration(seconds: 1), () {
          //          Navigator.pushNamed(context, '/home');
          //         // phoneController.clear();
          //         // setState(() {
          //         //   datetitle = null;
          //         //   datetime = null;
          //         //   typevalue = null;
          //         //   repeat = false;
          //         // });
          //       });
          //     } else {
          //       Fluttertoast.showToast(
          //           msg: "Incomplete information",
          //           toastLength: Toast.LENGTH_SHORT,
          //           gravity: ToastGravity.CENTER,
          //           timeInSecForIos: 1,
          //           backgroundColor: Colors.red,
          //           textColor: Colors.white,
          //           fontSize: 20.0);
          //     }
          //   },
          // )
        ],
      ),
    );


  }


@override
  void initState() {

    super.initState();
    print('object');
  }
  @override
  Widget build(BuildContext context) {
    return  getadddata();
  }
}
