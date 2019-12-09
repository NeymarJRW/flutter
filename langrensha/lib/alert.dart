import 'dart:async';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import './event/event.dart';
import 'Listdata.dart';

// import 'package:event_bus/event_bus.dart';
class Alert extends StatefulWidget {
  Alert({Key key,this.list,this.index}) : super(key: key);
   final List list;
   final int index;
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation; //控制透明度
  Animation animation2; //控制宽高
  int type; //显示类型
  List strlist; //对话数据数组
  List personlist = [
    ['assets/person1.png','甄姬'],
    ['assets/person2.png','曹丕'],
    ['assets/person3.png','你'],
    ['assets/person4.png','朱烁'],
    ['assets/person5.png','吴质'],
    ['assets/person6.png','曹操'],
    ['assets/person7.png','司马懿'],
    ['assets/person8.png','崔氏'],
  ]; //人物
  int currentpersonindex; //当前人物索引
  int currentindex ; //当前数据数组索引
  Timer timers; //定时器
  String str2 = ''; //变化显示的text文本
  _animation(double num1, double num2) {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    //宽高 num1 ,      当num1为200.0,点击时直接显示宽高
    animation2 = Tween(begin: num1, end: 300.0).animate(animationController)
      ..addListener(() {
        // print(animation.value);
      })
      ..addStatusListener((state) {
        // print(state);
      });
    //透明度 num2
    animation = Tween(begin: num2, end: 1.0).animate(animationController)
      ..addListener(() {
        // print(animation.value);
      })
      ..addStatusListener((state) {
        // print(state);
      });
    animationController.forward();
  }

  _timer(String strs) {
    int count = 0;
    const period = const Duration(milliseconds: 50);
    timers = Timer.periodic(period, (timer) {
      setState(() {
        str2 = strs.substring(0, count);
      });
      count++;
      if (count >= strs.length) {
        //取消定时器，避免无限回调
        timers.cancel();
        timers = null;
      }
    });
  }
String str='listitem2';
StreamSubscription _savadatarequest;
StreamSubscription _resetgame;
StreamSubscription _selectafter;
StreamSubscription _changeTitle;
  @override
  void initState() {
    super.initState();
    _animation(50.0, 0.0);
    strlist = widget.list;
    currentindex=widget.index;
    type=widget.list[currentindex][1];
    currentpersonindex=widget.list[currentindex][2];
    // print(strlist.indexOf('    故事开始于建安十七年,八月。 '));
    // strlist.forEach((f){
    //   if(f[0]=='    你是说,那个已经被主上斩了的妖道? '){
    //     print(strlist.indexOf(f));
    //   }

    // });
    eventBus.fire(new ChangeBg(strlist[currentindex][3]));
    _timer(strlist[currentindex][0]);

    //存档数据
    _savadatarequest = eventBus.on<Savadatarequest>().listen((event){
       eventBus.fire(new Sendsavedata(strlist,currentindex));
    });
    //重新开始游戏
    _resetgame=eventBus.on<Resetgame>().listen((event){
      // print('object');
        setState(() {
          strlist=Listdata.startlists;
          currentindex=0;
        });
       eventBus.fire(new ChangeTitle());
       eventBus.fire(new Hideselect());
    });
    
    //接收选择的选项
    _selectafter=eventBus.on<Selectafter>().listen((event){
        // print(strlist[currentindex][4][0].toString());
        if(strlist[currentindex][4][0]=='reset'){
            setState(() {
            strlist=Listdata.listitem1[event.listindex];
            currentindex=0;
          });
        }else{
          setState(() {
            strlist=strlist[currentindex][4][0][event.listindex];
            currentindex=0;
          });
        }

        // print(strlist[currentindex][4][0]);
        // print(event.listindex);
        eventBus.fire(new ChangeTitle());

    });

    //切换语句
    _changeTitle=eventBus.on<ChangeTitle>().listen((event) {
      // print('objectssss');
      if(strlist[currentindex].length==5){
        if(timers!=null){
          timers.cancel();
          timers = null;
        }

          setState(() {
            str2 = strlist[currentindex][0];
          });
          _animation(300.0, 1.0);
        eventBus.fire(new Showselect(strlist[currentindex][4][1]));
      }else{
          if (timers != null) {
            _animation(300.0, 1.0);
            timers.cancel();
            timers = null;
            setState(() {
              str2 = strlist[currentindex][0];
            });
          } else {
              // print('object');
            currentindex++;
            if (currentindex >= strlist.length) {
              setState(() {
                str2 = '结束了';
              });
            } else {
              _animation(50.0, 0.0);
              eventBus.fire(new ChangeBg(strlist[currentindex][3]));
              _timer(strlist[currentindex][0]);
              setState(() {
                type = strlist[currentindex][1];
                currentpersonindex = strlist[currentindex][2];
              });
            }
          }
      }

    });
  }
  @override
  void deactivate() {
    super.deactivate();
    // print('qweqwewqe');
     _savadatarequest.cancel();
    _resetgame.cancel();
    _selectafter.cancel();
    _changeTitle.cancel();
  }
  @override
  void dispose() {
    // print('ssssssssssssssssssssssssssss');
    super.dispose();

  
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Opacity(
      opacity: animation.value,
      child: type == 0
          ? Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                    Image.asset(
                      'assets/space.png',
                      width: animation2.value,
                      height: animation2.value,
                    ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      borderRadius: BorderRadius.circular(5.0)),
                  width: 600,
                  child: Text(
                    str2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          : type == 1
              ? Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Image.asset(
                      personlist[currentpersonindex][0],
                      width: animation2.value,
                      height: animation2.value,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20,bottom: 30,left: 30,right: 30),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, .3),
                          borderRadius: BorderRadius.circular(5.0)),
                      width: 600,
                      // height: 300,
                      child: Text(
                        str2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 8),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text(
                        personlist[currentpersonindex][1],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Image.asset(
                      personlist[currentpersonindex][0],
                      width: animation2.value,
                      height: animation2.value,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20,bottom: 30,left: 30,right: 30),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, .3),
                          borderRadius: BorderRadius.circular(5.0)),
                      width: 600,
                      // height: 300,
                      child: Text(
                        str2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 8),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text(
                        personlist[currentpersonindex][1],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
    ));
  }
}
