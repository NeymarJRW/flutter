import 'package:flutter/material.dart';
import 'package:langrensha/save.dart';
import './home.dart';
import './save.dart';
import './Listdata.dart';
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage('assets/homebg.png'), fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              left: 20,
              bottom: 40,
              child: Container(
                width: 200,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return HomePage(list: Listdata.startlists,index: 1);
                          })); 
                        },
                        child: Text(
                          '开始',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: FlatButton(
                    //     onPressed: () {
                    //       Navigator.push(context, new MaterialPageRoute(
                    //                   builder: (BuildContext context) {
                    //                    return SavePage();
                    //                 }
                    //       ));
                    //     },
                    //     child: Text(
                    //       '存档',
                    //       style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 25,
                    //           fontWeight: FontWeight.w800),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
