import 'package:flutter/material.dart';
import "../add/addpage.dart";
import '../home/homepage.dart';
import '../global_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState() => new IndexState();
}

class IndexState extends State<Index> with SingleTickerProviderStateMixin {
  TabController controller;
  String themestring;
  void _savetheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }

  void _gettheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('theme') == null) {
      prefs.setString('theme', 'light');
      setState(() {
        GlobalConfig.iconflag = true;
        GlobalConfig.themeData = new ThemeData.light();
        GlobalConfig.bgColor = Colors.blue;
      });
    } else {
      if (prefs.getString('theme') == 'light') {
        setState(() {
          GlobalConfig.iconflag = true;
          GlobalConfig.themeData = new ThemeData.light();
          GlobalConfig.bgColor = Colors.blue;
        });
      } else {
        setState(() {
          GlobalConfig.iconflag = false;
          GlobalConfig.themeData = new ThemeData.dark();
          GlobalConfig.bgColor = Colors.black26;
        });
      }
    }
    // prefs.clear();
    print(prefs.getString('theme'));
    print(GlobalConfig.iconflag);
  }



  @override
  void initState() {
    super.initState();
    _gettheme();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new Index(),
        },
        theme: GlobalConfig.themeData,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Countdown-Day'),
            actions: <Widget>[
              IconButton(
                // brightness_2
                icon: GlobalConfig.iconflag == true
                    ? Icon(Icons.brightness_high)
                    : Icon(Icons.brightness_2),
                tooltip: "edit",
                onPressed: () {
                  setState(() {
                    if (GlobalConfig.themeData == new ThemeData.dark()) {
                      GlobalConfig.themeData = new ThemeData.light();
                      GlobalConfig.bgColor = Colors.blue;
                      GlobalConfig.iconflag = true;
                      _savetheme('light');
                    } else {
                      GlobalConfig.themeData = new ThemeData.dark();
                      GlobalConfig.bgColor = Colors.black26;
                      GlobalConfig.iconflag = false;
                      _savetheme('dark');
                    }
                  });
                },
              ),
            ],
          ),
  
          body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new HomePage(),
              new AddPage(),
              // new ThemePage(),
            ],
          ),
          bottomNavigationBar: new Material(
            color: GlobalConfig.bgColor,
            child: new TabBar(
              controller: controller,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                new Tab(
                  text: "Home",
                  icon: new Icon(Icons.list),
                ),
                new Tab(
                  text: "Add",
                  icon: new Icon(Icons.add),
                ),
              ],
            ),
          ),
        ));
  }
}

//  showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return CupertinoActionSheet(
//           cancelButton: CupertinoActionSheetAction(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('data'),
//           ),
//           actions: <Widget>[
//             CupertinoActionSheetAction(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('data'),
//             ),
//             CupertinoActionSheetAction(
//               onPressed: () {
//                 Navigator.pop(context);
//               },

//               child: Text('data'),
//             ),
//           ],
//         );
//       });
