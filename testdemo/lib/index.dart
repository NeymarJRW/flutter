import 'package:flutter/material.dart';
import './pages/about.dart';
import './pages/add.dart';
import './pages/home.dart';
import './pages/setting.dart';
import './event.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentindex =2;
  List<Widget> list = List();

  void _listen() {
    eventBus.on <Pageindex> ().listen((event) {
        setState(() {
          _currentindex=event.index;
        });
    });
  }
// void _test(){
//   // print('object');
// }
  @override
  void initState() {
    super.initState();
    list.add(HomePage());
    list.add(AddPage());
    list.add(AboutPage());
    list.add(SettingPage());
  }

  @override
  Widget build(BuildContext context) {
    // _test();
    _listen();
    return Scaffold(
        body: list[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'home',
                  textAlign: TextAlign.center,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text(
                  'add',
                  textAlign: TextAlign.center,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_location),
                title: Text(
                  'about',
                  textAlign: TextAlign.center,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text(
                  'setting',
                  textAlign: TextAlign.center,
                )),
          ],
          backgroundColor:Colors.blue,
          currentIndex: _currentindex,
          onTap: (int index) {
            setState(() {
              _currentindex = index;
            });
          },
          iconSize:25.0,
          unselectedItemColor:Colors.white60,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ));
  }
}

