import 'package:flutter/material.dart';
import './list.dart';
import "./show.dart";

class PlanList extends StatefulWidget {
  PlanList({Key key}) : super(key: key);

  _PlanListState createState() => _PlanListState();
}

class _PlanListState extends State<PlanList>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset:false,
          appBar: PreferredSize(
              child: AppBar(
                // backgroundColor: Colors.lightBlue,
                bottom: new TabBar(
                controller: controller,
                indicatorWeight: 2.0,
                indicatorColor:Colors.blue,
                labelColor: Colors.white70,
                unselectedLabelColor: Colors.white30,
                tabs: <Widget>[
                  new Tab(          
                    child: Text('be on',style: TextStyle(fontSize: 12.0),),
                  ),
                  new Tab(
                    child: Text('be end',style: TextStyle(fontSize: 12.0)),
                  ),
                ],
              )),
              preferredSize: Size.fromHeight(50.0)),
          body: TabBarView(
            controller: controller,
            children: <Widget>[Lists(), Show()],
          )),
    );
  }
}
