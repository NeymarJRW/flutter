import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPlan extends StatefulWidget {
  AddPlan({Key key}) : super(key: key);

  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  _savedata(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  Widget icon;
  String iconname;
  Color colors;
  String title;
  String colorname;
  TextEditingController phoneController = TextEditingController();




  void _textFieldChanged(String str) {
    setState(() {
      title = str;
    });
  }

  @override
  void initState() {
    super.initState();
    print('object');
    icon = Icon(Icons.help);
    colors = Colors.blue;
    colorname='blue';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Add new target:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          height: 30.0,
                          child: RaisedButton(
                            color: Colors.grey,
                            textColor: Colors.white,
                            child: Text(
                              'reset',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            onPressed: () {
                              phoneController.clear();
                              setState(() {
                                icon = Icon(Icons.help);
                                colors = Colors.blue;
                                iconname = null;
                                 colorname='blue';
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 20.0,
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text(
                              'add',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            onPressed: () {
                              // Navigator.of(context).pushNamed('/add');
                              if (title != null &&
                                  colorname != null &&
                                  iconname != null) {
                                List<String> list = new List();
                                list.add(title);
                                list.add(colorname);
                                list.add(iconname);
                                _savedata(title, list);
                                Fluttertoast.showToast(
                                    msg: "Added Successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 20.0);

                                Timer backlast =
                                  new Timer(Duration(seconds: 1), () {
                                  phoneController.clear();
                                  setState(() {
                                    icon = Icon(Icons.help);
                                    colors = Colors.blue;
                                    iconname = null;
                                    colorname='blue';
                                  });
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Added Fail",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.red,
                                    fontSize: 20.0);
                              }

                            },
                          ),
                        )
                      ],
                    ),
                    flex: 1,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 20.0,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      onChanged: _textFieldChanged,
                      decoration: InputDecoration(
                        labelText: 'Name the target',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        hintText: 'please enter...',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 20.0,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Pick an icon and color'),
                  Container(
                    height: 20.0,
                    width: 20.0,
                  ),
                  icon,
                  Container(
                    height: 20.0,
                    width: 20.0,
                  ),
                  ClipOval(
                    child: Container(
                      color: colors,
                      width: 18.0,
                      height: 18.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 10.0,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.accessibility_new,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.accessibility_new);
                              iconname = 'accessibility_new';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.chrome_reader_mode,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.chrome_reader_mode);
                              iconname = 'chrome_reader_mode';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.access_alarm,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.access_alarm);
                              iconname = 'access_alarm';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.watch_later,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.watch_later);
                              iconname = 'watch_later';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.movie,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.movie);
                              iconname = 'movie';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 10.0,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.music_video,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.music_video);
                              iconname = 'music_video';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.edit,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.edit);
                              iconname = 'edit';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.directions_run,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.directions_run);
                              iconname = 'directions_run';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.restaurant,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.restaurant);
                              iconname = 'restaurant';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.fitness_center,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.fitness_center);
                              iconname = 'fitness_center';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 10.0,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.pool,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.pool);
                              iconname = 'pool';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.directions_bike,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.directions_bike);
                              iconname = 'directions_bike';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.videogame_asset,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.videogame_asset);
                              iconname = 'videogame_asset';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.today,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.today);
                              iconname = 'today';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Icon(
                            Icons.monetization_on,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              icon = Icon(Icons.monetization_on);
                              iconname = 'monetization_on';
                            });
                          },
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          colors = Colors.blue;
                          colorname = 'blue';
                        });
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.blue,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          colors = Colors.orange;
                          colorname = 'orange';
                        });
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.orange,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          colors = Colors.pink;
                          colorname = 'pink';
                        });
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.pink,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          colors = Colors.yellow;
                          colorname = 'yellow';
                        });
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.yellow,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          colors = Colors.purple;
                          colorname = 'purple';
                        });
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.purple,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          colors = Colors.black45;
                          colorname = 'black45';
                        });
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.black45,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
