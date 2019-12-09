import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  double bordernum = 0;
  AnimationController animationController;
  AnimationController animationController2;
  Animation animation1;
  Animation animation2;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    animationController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation1 = ColorTween(begin: Colors.pink, end: Colors.blue)
        .animate(animationController)
          ..addListener(() {
            // print(animation.value);
            setState(() {});
          })
          ..addStatusListener((state) {
            // print(state);
            if (state == AnimationStatus.completed) {
              animationController.reverse();
            } else if (state == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    animation2 = Tween(begin: 0.0, end: 150.0).animate(animationController2)
              ..addStatusListener((state) {
            // print(state);
            if (state == AnimationStatus.completed) {
              animationController2.reverse();
            } else if (state == AnimationStatus.dismissed) {
              animationController2.forward();
            }
          });;
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                animationController.forward();
                animationController2.forward();
                // final mySnackBar = SnackBar(
                //   content: Text('我是SnackBar',textAlign: TextAlign.center),
                //   backgroundColor: Colors.black,
                //   duration: Duration(seconds: 2),
                //   behavior: SnackBarBehavior.floating,
                //   // action: SnackBarAction(
                //   //     label: '我是scackbar按钮',
                //   //     onPressed: () {
                //   //       print('点击了snackbar按钮');
                //   //     }),
                // );
                // //显示
                // Scaffold.of(context).showSnackBar(mySnackBar);
              },
              icon: Icon(Icons.ac_unit),
            )
          ],
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: animation1.value,
                borderRadius: BorderRadius.circular(animation2.value)),
          ),
        ));
  }
}
