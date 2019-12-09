import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import './animation/animationroute.dart';

class Gamepage extends StatefulWidget {
  Gamepage({Key key, this.list}) : super(key: key);
  final List list;

  _GamepageState createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  List personlist;
  bool playgame;
  int count = 0;
  int score1;
  int score2;
  int score3;
  int pkscore;

  List list1 = [
    [1, Image.asset('images/shaizi/1.png')],
    [2, Image.asset('images/shaizi/2.png')],
    [3, Image.asset('images/shaizi/3.png')],
    [4, Image.asset('images/shaizi/4.png')],
    [5, Image.asset('images/shaizi/5.png')],
    [6, Image.asset('images/shaizi/6.png')],
  ];
  int shaizinum;

  _timer1() {
    const period = const Duration(milliseconds: 200);
    Timer.periodic(period, (timer) {
      //到时回调
      int randomnum = Random().nextInt(6);
      setState(() {
        shaizinum=randomnum;
      });
      count++;
      if (count >=15) {
        if(mounted){
          setState(() {
              count=0;
              score1=shaizinum+1;

          });
        }
        Timer backlast=new Timer(Duration(seconds: 2),(){
        _timer2();              
        });
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
      }
    });
  }

    _timer2() {
    const period = const Duration(milliseconds: 200);
    Timer.periodic(period, (timer) {
      //到时回调
      int randomnum = Random().nextInt(6);
      setState(() {
        shaizinum=randomnum;
      });
      count++;
      if (count >=15) {
        if(mounted){
          setState(() {
              count=0;
              score2=shaizinum+1;

          });
        }
        Timer backlast=new Timer(Duration(seconds: 2),(){
        _timer3();              
        });
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
      }
    });
  }
    _timer3() {
    const period = const Duration(milliseconds: 200);
    Timer.periodic(period, (timer) {
      //到时回调
      int randomnum = Random().nextInt(6);
      setState(() {
        shaizinum=randomnum;
      });
      count++;
      if (count >=15) {
        if(mounted){
          setState(() {
              count=0;
              score3=shaizinum+1;

          });
        }
        Timer backlast=new Timer(Duration(seconds: 2),(){
            int randomnum = Random().nextInt(18)+1;
            setState(() {
              count=0;
              pkscore= randomnum<3 ? 3 : randomnum;

          });         
        });
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    shaizinum=0;
    playgame = false;
    personlist = widget.list;
    print(personlist[0]);
    print(personlist[1]);
    // print( widget.list );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text('data'),
          actions: <Widget>[
            IconButton(
              tooltip: '重玩',
              color: Colors.white,
              icon: Icon(Icons.replay),
              onPressed: () {
                setState(() {
                  playgame=false;
                  count=0;
                  score1=null;
                  score2=null;
                  score3=null;
                  pkscore=null;
                });
              },
            ),
            IconButton(
              tooltip: '返回选人界面',
              color: Colors.white,
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');

              },
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        child: Text(''),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        // height: 200,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Image.asset(
                                  'images/person/${personlist[0][0]}.png'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                personlist[0][1],
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        child: Text(''),
                      ),
                    )

                    // Image.asset('images/person/1.png'),
                    // Text(
                    //   'data',
                    //   style: TextStyle(color: Colors.white),
                    // )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1)),
                    child: playgame == true
                        ? Center(
                          child: Column(
                            children: <Widget>[
                              list1[shaizinum][1],
                              SizedBox(height: 10,),
                              Text( score1==null ? ' '    :  '你的第一次分数为${score1.toString()}',style: TextStyle(color: Colors.white,fontSize: 12),),
                              SizedBox(height: 10,),
                              Text(score2==null ? ' '    :  '你的第二次分数为${score2.toString()}',style: TextStyle(color: Colors.white,fontSize: 12),),
                              SizedBox(height: 10,),
                              Text(score3==null ? ' '    :  '你的第三次分数为${score3.toString()}',style: TextStyle(color: Colors.white,fontSize: 12),),
                              SizedBox(height: 10,),
                            Text( (score1!=null && score2!=null && score3!=null) ?  '你的总分数为 :${score1+score2+score3}!' : '' ,style: TextStyle(color: Colors.white,fontSize:14 ),),
                              SizedBox(height: 10,),

                              Text((score1!=null && score2!=null && score3!=null) ? '对方正在摇骰子' :  (pkscore==null  ? ' ' :  '对方总分数为:$pkscore' ),style: TextStyle(color: Colors.white,fontSize: 12),),
                              SizedBox(height: 10,),
                               Text(pkscore==null  ? ' ' :  '对方总分数为:$pkscore!' ,style: TextStyle(color: Colors.white,fontSize:14),),
                              SizedBox(height: 10,),
                              score1!=null&&pkscore!=null 
                              ?
                              Text( (score1+score2+score3) > pkscore 
                              ? ' 你赢了!!' 
                              :
                               ( ((score1+score2+score3) == pkscore) 
                               ?  '平局!' 
                               : '你输了!'
                               )  ,style: TextStyle(color: Colors.white,fontSize:15,fontWeight: FontWeight.w700), )
                              :
                              Text('')
                            ],
                          ),
                        )
                        : Center(
                            child: Container(
                            // color: Colors.yellow,
                            width: 200,
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      playgame = true;
                                    });
                                    _timer1();
                                  },
                                  icon: Icon(Icons.play_arrow),
                                  iconSize: 50,
                                  color: Colors.white,
                                ),
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      playgame = true;
                                    });
                                    _timer1();
                                  },
                                  child: Text(
                                    '开始游戏',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ))),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        child: Text(''),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        // height: 200,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Image.asset(
                                  'images/person/${personlist[1][0]}.png'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                personlist[1][1],
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        child: Text(''),
                      ),
                    )

                    // Image.asset('images/person/1.png'),
                    // Text(
                    //   'data',
                    //   style: TextStyle(color: Colors.white),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
