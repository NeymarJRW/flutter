import 'package:flutter/material.dart';
import 'list/list.dart';
import 'note/note.dart';
import 'package:flutter/cupertino.dart';
import './event/event.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _list = [ListPage(), NotePage()];
  int _currentindex = 0;
  String weight;

  // List<Widget> _weightList = new List();
  TextEditingController _controller;
  void _controllerchange(str) {
    print(weight);
    setState(() {
      weight = str;
    });
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
      body: Container(
        // color: Colors.blue,
        child: _list[_currentindex],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff232d37),
        onPressed: () {
          // setState(() {
          //   _currentindex = 1;
          // });
          // Navigator.of(context).push(CustomRoute(AddPage()));
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
                                prefixIcon: Icon(Icons.local_airport),
                                hintText: 'Your weight today',
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
                            Navigator.pop(context);
                            DateTime time = DateTime.now();
                            eventBus.fire(new GetDate(time, weight));
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

// CupertinoPicker(
//                         itemExtent: 40,
//                         onSelectedItemChanged: (position) {
//                           print('The position is $position');
//                         },
//                         children: List.generate(140, (item){
//                           return Text((item+40).toString()+'KG');
//                         })
//                         ));
