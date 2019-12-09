import 'dart:async';
import 'dart:math';
import '../gamepage.dart';
import 'package:flutter/material.dart';
import '../animation/animationroute.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.number, this.name}) : super(key: key);
  final String name;
  final int number;

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int picnum;
  int pkpersonnum;
  int count = 0;
  bool pkflag;
  List list1 = [
    [1, '贾诩', Image.asset('images/person/1.png')],
    [2, '甄姬', Image.asset('images/person/2.png')],
    [3, '凌统', Image.asset('images/person/3.png')],
    [4, '张飞', Image.asset('images/person/4.png')],
    [5, '诸葛亮', Image.asset('images/person/5.png')],
    [6, '马超', Image.asset('images/person/6.png')],
    [7, '貂蝉', Image.asset('images/person/7.png')],
    [8, '吕布', Image.asset('images/person/8.png')],
    [9, '郭嘉', Image.asset('images/person/9.png')],
    [10, '张角', Image.asset('images/person/10.png')],
    [11, '许诸', Image.asset('images/person/11.png')],
    [12, '羊祜', Image.asset('images/person/12.png')],
    [13, '关羽', Image.asset('images/person/13.png')],
    [14, '颜良', Image.asset('images/person/14.png')],
    [15, '关兴', Image.asset('images/person/15.png')],
    [16, '周瑜', Image.asset('images/person/16.png')]
  ];




  _timer() {
    const period = const Duration(milliseconds: 200);
    Timer.periodic(period, (timer) {
      //到时回调
      int randomnum = Random().nextInt(16);
      if ((randomnum + 1) != widget.number) {
        setState(() {
          pkpersonnum = randomnum;
        });
      }
      // print(randomnum);
      count++;
      if (count >= 20) {
        if (mounted) {
          setState(() {
            pkflag = true;
          });
        }
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
      }
    });
  }

  @override
  void initState() {
    _timer();
    pkflag = false;
    pkpersonnum = 0;
    super.initState();
    picnum = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          title: Text(
            pkflag == true
              ? '你随机匹配的对手为 : ${list1[pkpersonnum][1]}'
              : '正在为你随机匹配对手'
              ),
          actions: <Widget>[
            pkflag == true
                ? Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(CustomRoute(
                          Gamepage(list:[ [widget.number,widget.name],[ (pkpersonnum+1), list1[pkpersonnum][1] ]]))
                        );

                        // Navigator.push(context, new MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //   return Gamepage(list:[ [widget.number,widget.name],[ (pkpersonnum+1), list1[pkpersonnum][1] ]]);
                        // }));
                      },
                      child: Text(
                        '开始游戏',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : Text(' ')
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(40),
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
                  flex: 2,
                  child: Image.asset('images/person/$picnum.png'),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset('images/pk.png'),
                ),
                Expanded(flex: 2, child: list1[pkpersonnum][2])
              ],
            )));
  }
}
