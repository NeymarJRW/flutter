import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../add/idnex.dart';
import '../plan/index.dart';
import '../my/index.dart';
import '../provider.dart';
import '../event.dart';

class HomePage extends StatefulWidget {
  // HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  ThemeData themes =ThemeData.light();
  Color colors=Colors.blue;

  void _listen(){
    eventBus.on<UserThemeEvent>().listen((event){
      // print(event.text);
      if(event.text=='dark'){
        setState(() {
          themes =ThemeData.dark();
          colors=Colors.black45;
        });
      }else{
       setState(() {
          themes =ThemeData.light();
          colors=Colors.blue;
        });
      }
      // Provider.of<Counter>(context).toggle();

    });
  }
  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    // setState(() {
      // print(Provider.of<Counter>(context).themedata);
      // themes = ;
      // colors=Colors.blue;
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listen(); 
    return MaterialApp(
      theme: themes,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new PlanList(),
        '/add': (BuildContext context) => new MyPage(),
      },
      debugShowCheckedModeBanner: false,
      title: '${Provider.of<Counter>(context).title}',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text( '${Provider.of<Counter>(context).title}' ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[ PlanList(), AddPlan(), MyPage() ],
        ),
        bottomNavigationBar: Material(
          color: colors,
          child: TabBar(
            controller: controller,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
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
                text: "Setting",
                icon: Icon(Icons.build),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
