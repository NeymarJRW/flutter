import 'package:flutter/material.dart';
import '../add/idnex.dart';
import '../plan/index.dart';
import '../my/index.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {

    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        // routes: <String, WidgetBuilder>{
        //   '/add': (BuildContext context) => new MyPage(),
        // },
        debugShowCheckedModeBanner: false,
        title: 'daka',
        home: Scaffold(
        resizeToAvoidBottomInset:false,

          appBar: AppBar(
            title: Text('da-ka'),
          ),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              PlanList(),
              AddPlan(),
              MyPage()

            ],
          ),
          bottomNavigationBar: Material(
            color: Colors.blue,
            child: 
            TabBar(
              controller: controller,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black45,
              tabs: <Widget>[
                new Tab(
                  text: "Plan",
                  icon: Icon(Icons.assessment),
                ),
                new Tab(
                  text: "Add",
                  icon: Icon(Icons.add_alert),
                ),
                new Tab(
                  text: "Add",
                  icon: Icon(Icons.my_location),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
