import 'package:flutter/material.dart';
import '../provider.dart';
import 'package:provider/provider.dart';
import '../event.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String texts = 'light';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Card(
                elevation: 12.0,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Remind me to clock',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                              child: Switch(
                            value: true,
                            activeColor: Colors.blue, // 激活时原点颜色
                            onChanged: (bool val) {
                              print('45555555');
                            },
                          )),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                  elevation: 12.0,
                  child: Center(
                    child: Row(children: <Widget>[
                      Expanded(
                          child: FlatButton(
                            onPressed: () {
                              texts = 'light';
                              Provider.of<Counter>(context).daychange();
                              eventBus.fire(new UserThemeEvent(texts));
                            },
                            padding: EdgeInsets.all(0),
                            child: Card(
                              color: Provider.of<Counter>(context).daycolor,
                              child: Center(
                                child: Text(
                                  'Day mode',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                          flex: 1),
                      Expanded(
                          child: FlatButton(
                            onPressed: () {
                              texts = 'dark';
                              Provider.of<Counter>(context).nightchange();
                              eventBus.fire(new UserThemeEvent(texts));
                            },
                            padding: EdgeInsets.all(0),
                            child: Card(
                              color: Provider.of<Counter>(context).nightcolor,
                              child: Center(
                                child: Text('Night mode',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0)),
                              ),
                            ),
                          ),
                          flex: 1),
                    ]),
                  )),
            ),

          ],
        ));
  }
}
