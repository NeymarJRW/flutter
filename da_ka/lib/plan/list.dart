import 'dart:async';
import 'package:da_ka/plan/daka.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './daka.dart';

class Lists extends StatefulWidget {
  Lists({Key key}) : super(key: key);

  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
    String days;

  _gettargetlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List list = new List();
    // prefs.clear();
    prefs.getKeys().toList().forEach((f) => {
      list.add(prefs.getStringList(f))
      });
    setState(() {
      childwidgetlist = list;
    });
  }

  //列表数组信息
  List childwidgetlist = new List();
  //获取全部列表函数
  List<Widget> _getList(list) {
    List<Widget> widgetlist = new List();
    list.forEach((item) => {widgetlist.add(targetlist(item))});
    return widgetlist;
  }

  Widget targetlist(item) {
    String title = item[0];
    String colorname = item[1];
    String iconname = item[2];
    Color colors;

    IconData icon;
    List datalist = [
      ['accessibility_new', Icons.accessibility_new],
      ['chrome_reader_mode', Icons.chrome_reader_mode],
      ['access_alarm', Icons.access_alarm],
      ['watch_later', Icons.watch_later],
      ['movie', Icons.movie],
      ['music_video', Icons.music_video],
      ['edit', Icons.edit],
      ['directions_run', Icons.directions_run],
      ['restaurant', Icons.restaurant],
      ['fitness_center', Icons.fitness_center],
      ['pool', Icons.pool],
      ['directions_bike', Icons.directions_bike],
      ['videogame_asset', Icons.videogame_asset],
      ['today', Icons.today],
      ['monetization_on', Icons.monetization_on],
    ];
    datalist.forEach((items) {
      if (items[0].toString() == iconname) {
        icon = items[1];
      }
    });
    switch (colorname) {
      case 'blue':
        {
          colors = Colors.blue;
        }
        break;

      case 'orange':
        {
          colors = Colors.orange;
          //statements;
        }
        break;

      case 'pink':
        {
          colors = Colors.pink;
          //statements;
        }
        break;
      case 'yellow':
        {
          colors = Colors.yellow;
          //statements;
        }
        break;
      case 'purple':
        {
          colors = Colors.purple;
          //statements;
        }
        break;
      case 'black45':
        {
          colors = Colors.black45;
          //statements;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }

    return FlatButton(
        onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
                 return DakaPage(item:item);
            })).then((onValue){
              if(onValue=='true'){
                _gettargetlist();
              }
            });

        },
        child: Column(
          children: <Widget>[
            Container(
              height: 60.0,
              color: colors,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    flex: 4,
                  ),
                  // Expanded(
                  //   child: Text(''),
                  //   flex: 4,
                  // ),
                  Expanded(
                    child: Container(
                      padding: new EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Text('keep',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.white)),
                          ),
                          Expanded(
                            child: Text('1 day',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            Container(
              height: 10.0,
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    _gettargetlist();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: new EdgeInsets.all(8.0),
        child:
        
          childwidgetlist.length>0 
          ? ListView(
            children:_getList(childwidgetlist)
            )
          : Center(
            child: Text('No target temporarily...') 
          )
        );
  }
}
