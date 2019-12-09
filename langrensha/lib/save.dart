import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';
import './Listdata.dart';
class SavePage extends StatefulWidget {
  SavePage({Key key}) : super(key: key);
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  List listdata ;
  //获取本地存储的列表信息
  _getsavedata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getKeys().toList());
    List list = new List();
    // prefs.clear();
    if (prefs.getKeys().toList().length > 0) {
      prefs.getKeys().toList().forEach((f) {
        list.add([prefs.getStringList(f)[0],prefs.getStringList(f)[1],prefs.getStringList(f)[2]]);
      });
      setState(() {
        listdata=list;
      });

    }
    // prefs.clear();
  }

  @override
  void initState() {
    super.initState();
    _getsavedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 400,
        color: Colors.red,
        child: ListView(
          children:
          listdata!=null ? 
           listdata.map((val) {
            // print(val[1]);
            return ListTile(
              title: Text(val[0]),
              onTap: () {
                List list=[ Listdata.lists,Listdata.listitem1  ];
                     Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return HomePage(list:Listdata.listitem1[2],index: 6);
                          })); 
              },
            );
          }).toList()
          :
          <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('暂时没有存档记录!!',style: TextStyle(fontSize: 25),),
            )
          ]
          

        ),
      ),
    ));
  }
}
