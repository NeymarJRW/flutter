import 'package:flutter/material.dart';
import './animation/animationroute.dart';
import './detail/detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list1 = [
    [1, '贾诩', 85, 86],
    [2, '甄姬', 80, 95],
    [3, '凌统', 88, 80],
    [4, '张飞', 90, 85]
  ];
  List list2 = [
    [5, '诸葛亮', 75, 95],
    [6, '马超', 90, 82],
    [7, '貂蝉', 78, 93],
    [8, '吕布', 95, 90]
  ];
  List list3 = [
    [9, '郭嘉', 85, 80],
    [10, '张角', 89, 75],
    [11, '许诸', 82, 79],
    [12, '羊祜', 85, 85]
  ];
  List list4 = [
    [13, '关羽', 96, 92],
    [14, '颜良', 90, 86],
    [15, '关兴', 90, 85],
    [16, '周瑜', 88, 86]
  ];
  String select;//武将名
  int selectnum;//数组index
  int attack;//武力值
  int lucky;//幸运值

  Widget getperson(List item) {
    return Expanded(
        flex: 1,
        child: FlatButton(
          onPressed: () {
            setState(() {
              select = item[1];
              selectnum = item[0];
              attack = item[2];
              lucky = item[3];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: selectnum == item[0]
                  ? new Border.all(width: 2.0, color: Colors.white60)
                  : Border(),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'images/person/${item[0]}.png',
                    fit: BoxFit.fill,
                    // width: 200,
                    // height: 100,
                  ),
                ),
                Text(
                  item[1],
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        ));
  }

  List<Widget> _getpersonwidget(List list) {
    List<Widget> widgetlist = new List();
    list.forEach((i) => {widgetlist.add(getperson(i))});
    return widgetlist;
  }

  List<Widget> _getall(List list) {
    List<Widget> widgetlist = new List();
    list.forEach((i) => {
          widgetlist.add(
            Container(
                height: 100,
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: _getpersonwidget(i),
                )),
          )
        });
    return widgetlist;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              select == null ? '选择你要使用的武将' : '你选择的武将为 : $select',
              style: TextStyle(fontSize: 22),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showDialog<Null>(
                    context: context,
                    builder: (BuildContext context) {
                      return new SimpleDialog(
                        backgroundColor: Colors.transparent,
                        children: <Widget>[
                          Stack(
                            alignment: AlignmentDirectional(1.1, -0.8),
                            children: <Widget>[
                              Image.asset(
                                'images/info.png',
                                width: 320,
                                height: 320,
                                fit: BoxFit.fill,
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 30,
                ),
                tooltip: ' ',
              ),
              select != null
                  ? IconButton(
                      icon: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 30,
                      ),
                      tooltip: ' ',
                      onPressed: () {
                        // print('ssss');
                        Navigator.of(context).push(CustomRoute(
                            DetailPage(number: selectnum, name: select)));
                        // Navigator.push(context, new MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //   return DetailPage(number: selectnum, name: select);
                        // }));
                      },
                    )
                  : Text(' ')
            ]),
        body: Container(
            decoration: BoxDecoration(
              // color: Colors.black45
              image: DecorationImage(
                image: AssetImage("images/bg3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child:
                      ListView(children: _getall([list1, list2, list3, list4])),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(right: 30),
                    decoration: BoxDecoration(
                        // border:
                        //     new Border.all(width: 2.0, color: Colors.white60)
                        ),
                    child: Center(
                        child: select == null
                            ? Text(
                                '武将信息',
                                style: TextStyle(color: Colors.white),
                              )
                            : Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset('images/person/$selectnum.png'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    select,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '武力值 : ${attack.toString()}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '幸运值 : ${lucky.toString()}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                  ),
                )
                // Text('data')
              ],
            )));
  }
}
