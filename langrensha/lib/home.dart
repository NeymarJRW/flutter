import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:langrensha/event/event.dart';
import 'package:langrensha/index.dart';
import 'alert.dart';
import './event/event.dart';
import './index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Listdata.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key,this.list,this.index}) : super(key: key);
   final List list;
   final int index;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List sendlist;
  int sendindex;
  int sendpersonindex;
  _savedata(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }
  StreamSubscription _changeBg;
  StreamSubscription _showselect;
  StreamSubscription _hideselect;
  StreamSubscription _sendsavedata;
  List listbg = [
    AssetImage('assets/bg.png'),
    AssetImage('assets/bg2.png'),
    AssetImage('assets/bg3.png'),
    AssetImage('assets/bg4.png'),
    AssetImage('assets/bg5.png'),
    AssetImage('assets/bg6.png'),
    AssetImage('assets/bg7.png'),
    AssetImage('assets/bg8.png'),
    AssetImage('assets/bg9.png'),
    AssetImage('assets/bg10.png'),
  ];
  List tiplist;
  bool tipflag = false;
  Widget tipselect(List list) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 200,
      width: 300,
      child: Column(
          children: list.map((val) {
        return Expanded(
          flex: 1,
          child: FlatButton(
            onPressed: () {
              eventBus.fire(new Selectafter(list.indexOf(val)));
              setState(() {
                tipflag = false;
              });
            },
            child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, .6),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    val,
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
        );
      }).toList()),
    );
  }

  int index = 2;


  @override
  void initState() {
    super.initState();
    sendlist=widget.list;
    sendindex=widget.index;

    //切换场景
   _changeBg= eventBus.on<ChangeBg>().listen((event) {
      // print(event.nums);
      setState(() {
        index = event.nums;
      });
    });

    //显示选项
   _showselect = eventBus.on<Showselect>().listen((event) {
      setState(() {
        tipflag = true;
        tiplist = event.list;
      });
    });

    //点击后隐藏选项
  _hideselect =eventBus.on<Hideselect>().listen((event) {
      setState(() {
        tipflag = false;
      });
    });

    //获取当前数据数组和index
   _sendsavedata= eventBus.on<Sendsavedata>().listen((event){
      DateTime dateTime=DateTime.now();
      List<String> list=new List();
      String times=dateTime.year.toString()+'-'+dateTime.month.toString()+'-'+dateTime.day.toString();
      // print(event.list);
      // print(event.index);
      list.add(times);
      list.add(event.list.toString());
      list.add(event.index.toString());
      _savedata(dateTime.toString(),list );
      print('存档成功');
    });
  }
  @override
  void deactivate() {
    super.deactivate();
    _changeBg.cancel();
    _showselect.cancel();
    _hideselect.cancel();
    _sendsavedata.cancel();

  }
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: GestureDetector(
              onTap: () {
                eventBus.fire(new ChangeTitle());
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: listbg[index], fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: Alert(list:sendlist,index: sendindex),
                          )
                        ],
                      )),
                  tipflag == true ? tipselect(tiplist) : Text(''),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                          width: 110,
                          height: 30,
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  onPressed: () {
                                      Navigator.push(context, new MaterialPageRoute(
                                      builder: (BuildContext context) {
                                      return IndexPage();
                                  })); 
                                  },
                                  child: Image.asset(
                                    'assets/home.png',
                                    width: 40,
                                    height: 20,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  onPressed: () {
                                    showDialog<Null>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return new SimpleDialog(
                                          backgroundColor: Colors.transparent,
                                          children: <Widget>[
                                            Stack(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              children: <Widget>[
                                                Container(
                                                  width: 200,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, .7),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                ),
                                                Positioned(
                                                  right: 10,
                                                  top: 0,
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // left: 100,
                                                  top: 10,
                                                  child: Container(
                                                    height: 100,
                                                    width: 200,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 1,
                                                          child: FlatButton(
                                                            onPressed: () {
                                                              eventBus.fire(
                                                                  new Resetgame());
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              '重新开始',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        // Expanded(
                                                        //   flex: 1,
                                                        //   child: FlatButton(
                                                        //     onPressed: () {
                                                                
                                                        // // DateTime datetime=DateTime.now();
                                                        // // print(datetime);
                                                        //        eventBus.fire(new Savadatarequest());
                                                        //     },
                                                        //     child: Text(
                                                        //       '存档',
                                                        //       style: TextStyle(
                                                        //           fontSize: 20,
                                                        //           color: Colors
                                                        //               .white),
                                                        //       textAlign:
                                                        //           TextAlign
                                                        //               .center,
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Image.asset(
                                    'assets/menu.png',
                                    width: 40,
                                    height: 30,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ],
              ))),
    );
  }
}
