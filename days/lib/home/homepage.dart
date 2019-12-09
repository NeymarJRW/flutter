import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import './editdate.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> datelist= ['Christmas','holiday','salary','Party','tour'];

  //倒计时详情页
  Widget detailsPage(item, day) {
    _deletitem(title) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(title);
      List list = new List();
      // prefs.clear();
      // if (prefs.getKeys().toList().length > 0) {
      prefs.getKeys().toList().forEach((f) {
        if (f != 'theme') {
          list.add(prefs.getStringList(f));
        }
      });
      print(list);
      setState(() {
        childwidgetlist = list;
      });
      // }
    }

    int randomnum = Random().nextInt(9) + 1;
    return Scaffold(
        appBar: AppBar(
          title: Text("details"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              tooltip: "edit",
              onPressed: () {
                // print('object');
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return EditPage(item: item);
                }));
                // Navigator.of(context).pushNamed('/edit');
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              tooltip: "delete",
              onPressed: () {
                // Navigator.pop(context);
                // Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('这是一个SnackBar!')));
                _deletitem(item[0]);
                Fluttertoast.showToast(
                    msg: "Successful deletion",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 20.0);
                Timer backlast = new Timer(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg$randomnum.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Container(
            height: 300,
            width: 300,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item[0],
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                    item[1],
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('Countdown',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      Text(
                        day.toString(),
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(day > 1 ? 'days' : 'day',
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ),
                  flex: 4,
                )
              ],
            ),
          )),
        ));
  }

  //获取全部倒计时列表
  Widget getdatelist(item) {
    var datetitle = item[0];
    var datetime = item[1];
    String dateicon = item[2];
    List<String> newtime = datetime.split("-");
    int year = int.parse(newtime[0]);
    int month = int.parse(newtime[1]);
    int day = int.parse(newtime[2]);
    var nowtime = DateTime.now();
    var d1 = new DateTime(nowtime.year, nowtime.month, nowtime.day); //现在时间
    var d2 = new DateTime(year, month, day); //倒计时时间
    var count = d2.difference(d1).inDays;
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.black26))),
        child: FlatButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return detailsPage(item, count);
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'images/$dateicon.png',
                width: 40,
                height: 40,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      datetitle,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      datetime,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                flex: 4,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Countdown'),
                    Text(
                      count.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    Text(count > 1 ? 'days' : 'day')
                  ],
                ),
                flex: 5,
              )
            ],
          ),
        ));
  }

  //获取全部列表函数
  List<Widget> _getList(list) {
    List<Widget> widgetlist = new List();

    list.forEach((item) => {widgetlist.add(getdatelist(item))});
    return widgetlist;
  }

  //列表数组信息
  List childwidgetlist = new List();

  @override
  void initState() {
    super.initState();
    _loadsave();
  }

  //获取本地存储的列表信息
  _loadsave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getKeys().toList()) ;
    List list = new List();
    // prefs.clear();
    if (prefs.getKeys().toList().length > 0) {
      prefs.getKeys().toList().forEach((f) {
        if (f != 'theme') {
          list.add(prefs.getStringList(f));
        }
      });
      // print(list);
      setState(() {
        childwidgetlist = list;
      });
    }
    // prefs.clear();
  }

  //渲染
  Widget build(BuildContext context) {
    return Scaffold(
        body: childwidgetlist.length > 0
            ? Container(
                padding: EdgeInsets.all(15),
                child: ListView(
                    children:
                        // childwidgetlist.map((item)=>_getList(item[0]))
                        _getList(childwidgetlist)),
              )
            : Center(
                child: Text("You don't have a schedule yet.",
                    style: TextStyle(fontSize: 20.0)),
              ));
    // return
  }
}
