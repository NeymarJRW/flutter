// import 'package:event_bus/event_bus.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list/list.dart';
// import 'note/note.dart';
import 'add/add.dart';
import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
import './provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import './event/event.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _list = [ListPage(), AddPage()];
  int _currentindex = 0;
  String weight;
  TextEditingController _controller;

  void _controllerchange(str) {
    setState(() {
      weight = str;
    });
  }

  void _toast(String title, Color color) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1, //多久关闭
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 20.0);
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        // color: Colors.blue,
        child: _list[_currentindex],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff232d37),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: 400,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(''),
                              flex: 3,
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: ClipOval(
                                  child: Container(
                                    color: Color(0xff232d37),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextField(
                            onChanged: _controllerchange,
                            controller: _controller,
                            decoration: InputDecoration(
                                //  helperText: 'KG',
                                suffixText: 'KG',
                                prefixIcon: Icon(Icons.accessibility),
                                hintText: 'Your weight today...',
                                // contentPadding: new EdgeInsets.all(0.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          onPressed: () {
                            if (weight != null) {
                              bool flag = true;
                              double nums;
                              try {
                                double.parse(weight);
                              } catch (e) {
                                // 匹配所以类型的异常. e是异常对象，r是StackTrace对象，异常的堆栈信息
                                print('有错');
                                flag = false;
                              }
                              if (flag) {
                                    nums=double.parse(weight);
                                  if(nums>40 && nums<300 ){
                                      Provider.of<Counter>(context).savedata(weight);
                                        // eventBus.fire(new GetWeight(weight));
                                        _toast('Added Successfully', Colors.black);
                                        Navigator.pop(context);
                                  }else{
                                        _toast('Weight should be greater than 40 kg and less than 300 kg', Colors.red);
                                  }
                              }else{
                                _toast('Wrong weight ', Colors.red);
                              }
                            } else {
                              _toast('Wrong weight ', Colors.red);
                            }
                          },
                          child: Container(
                            // color: Colors.blue,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff232d37),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                )
                                // shape: BoxShape.circle
                                ),
                            child: Center(
                              child: Text(
                                'add',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ));
              });
        },
        tooltip: '添加',
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff232d37),
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _currentindex = 0;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.list,
                            color: _currentindex == 0
                                ? Colors.white
                                : Colors.white54),
                        Text(
                          'list',
                          style: TextStyle(
                              color: _currentindex == 0
                                  ? Colors.white
                                  : Colors.white54),
                        )
                      ],
                    ),
                  )),
              flex: 1,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _currentindex = 1;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.person,
                            color: _currentindex == 1
                                ? Colors.white
                                : Colors.white54),
                        Text(
                          'my',
                          style: TextStyle(
                              color: _currentindex == 1
                                  ? Colors.white
                                  : Colors.white54),
                        )
                      ],
                    ),
                  )),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
