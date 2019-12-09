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
                bottom: new TabBar(
                controller: controller,
                indicatorWeight: 2.0,
                labelColor: Colors.white70,
                unselectedLabelColor: Colors.black38,
                tabs: <Widget>[
                  new Tab(
                    icon: new Icon(Icons.directions_bike),
                  ),
                  new Tab(
                    icon: new Icon(Icons.directions_boat),
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
