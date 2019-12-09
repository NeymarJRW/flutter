import 'package:flutter/material.dart';
import 'package:circle_list/circle_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> list = List.generate(10, (index){
    print(index);
    return 
    Row(
      children: <Widget>[
            Icon(
            Icons.home,
            color: index % 2==0 ? Colors.blue : Colors.red ,  
            size: 30.0,
            ),
            Text(index.toString())
      ],
    );



  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: CircleList(
            childrenPadding:40,
            origin: Offset(0, 0),
            children: list,
            centerWidget: FlatButton(
              onPressed: (){
                setState(() {
                  
                  
                });
              },
              child: Icon(Icons.local_airport,size: 120,),

            ),
          )
        ));
  }
}