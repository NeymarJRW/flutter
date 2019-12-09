import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  double width = 0;
  double height = 0;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    animation=Tween(begin: 0.0,end: 400.0).animate(animationController)
      ..addListener((){
        print(animation.value);
        setState(() {
        width = animation.value.toDouble();
        height = animation.value.toDouble();
      });
      })
      ..addStatusListener((state){
        
      })
    ;
    // animationController.addListener(() {
    //   // print(animationController.value);
    //   setState(() {
    //     width = animationController.value.toDouble() * 100;
    //     height = animationController.value.toDouble() * 600;
    //   });
    // });
    // animationController.addStatusListener((state){
    //   print(state);
    //   if(state==AnimationStatus.completed){
    //     animationController.reverse();
    //   }
    // });
    //  animationController.forward(); 
  }
  @override
  void dispose() {

    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          Container(
            width: width,
            height: height ,
            color: Colors.blue,
            child: Text('data'),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              color: Colors.blue,
              elevation: 10,
              onPressed: () {
                animationController.forward();
              },
              child: Text(
                'click',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
