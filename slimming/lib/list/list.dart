import 'dart:async';
import 'dart:core';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../event/event.dart';
import '../provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String weight;
  String targetweight;
  String rangeweight;
  String datetime;
  String today;
  String recordday;
  String lasttime;
  TextEditingController _controller;
  DateTime startdate;

  void _toast(String title, Color color) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1, //多久关闭
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  void _controllerchange(str) {
    setState(() {
      targetweight = str;
    });
  }

  void _getdata() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime date = DateTime.now();
    String time = date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString();
    List list = new List();

    prefs.getKeys().toList().forEach((item) {
      if (item != 'TargetWeight') {
        list.add(item);
      }
    });
    // print(prefs.getKeys().toList());
    print(list);
    if(list.length>=2){
      String thisweight=prefs.getStringList(list[list.length-1])[1].toString();
      String lastweight=prefs.getStringList(list[list.length-2])[1].toString();
      setState(() {
        lasttime=(double.parse(thisweight)-double.parse(lastweight)).toString();
      });
    }
    // print(prefs.getStringList(list[list.length-1]));
     setState(() {
      recordday=list.length.toString();
    });
  
    if (prefs.getStringList(time) != null) {
      setState(() {
        weight = prefs.getStringList(time)[1];
        targetweight = prefs.getString('TargetWeight');
      });
    }


    if (weight != null && targetweight != null) {
      setState(() {
        rangeweight = double.parse(weight) >= double.parse(targetweight)
            ? (double.parse(weight) - double.parse(targetweight)).toString()
            : (double.parse(targetweight) - double.parse(weight)).toString();
      });
    }

    // prefs.clear();
  }

  StreamSubscription _listen;
  StreamSubscription _target;

  @override
  void initState() {
    super.initState();
  
    _getdata();
    startdate = DateTime.now();
    _listen = eventBus.on<GetWeight>().listen((event) {

    _getdata();
      setState(() {
        weight = event.weight;
      });
      if (weight != null && targetweight != null) {
        setState(() {
          rangeweight = double.parse(weight) >= double.parse(targetweight)
              ? (double.parse(weight) - double.parse(targetweight)).toString()
              : (double.parse(targetweight) - double.parse(weight)).toString();
        });
      }
      
    });
    _target = eventBus.on<TargetWeight>().listen((event) {
      _getdata();

      setState(() {
        targetweight = event.weight;
      });
      if (weight != null && targetweight != null) {
        setState(() {
          rangeweight = double.parse(weight) >= double.parse(targetweight)
              ? (double.parse(weight) - double.parse(targetweight)).toString()
              : (double.parse(targetweight) - double.parse(weight)).toString();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _listen.dispose();
    _listen.cancel();
    _target.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context));

    return SafeArea(
        child: Container(
      // color: Color(0xff232d37),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // color: Colors.red,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        '$recordday days have been recorded',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    flex: 1,
                  ),
                  weight == null
                      ? Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Unrecorded',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      'today!',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                                // flex: 1,
                              ),
                            ],
                          ),
                          flex: 1,
                        )
                      : Expanded(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 90,
                                ),
                                Center(
                                  child: Text('Recorded',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                Center(
                                  child: Text(
                                      weight == null ? 'no weight' : weight,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40)),
                                ),
                                Center(
                                  child: Text('KG',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13)),
                                ),
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        SizedBox(height:60,),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'with last time',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  lasttime == null ? 'nothing'  : lasttime,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: FlatButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 400,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(''),
                                                    flex: 3,
                                                  ),
                                                  Expanded(
                                                    child: FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: ClipOval(
                                                        child: Container(
                                                          color:
                                                              Color(0xff232d37),
                                                          child: Icon(
                                                            Icons.close,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 18.0),
                                                child: TextField(
                                                  onChanged: _controllerchange,
                                                  controller: _controller,
                                                  decoration: InputDecoration(
                                                      //  helperText: 'KG',
                                                      suffixText: 'KG',
                                                      prefixIcon: Icon(
                                                          Icons.assignment),
                                                      hintText:
                                                          'Your target weight...',
                                                      // contentPadding: new EdgeInsets.all(0.0),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              FlatButton(
                                                onPressed: () {
                                                  if (targetweight != null) {
                                                    bool flag = true;
                                                    double nums;
                                                    try {
                                                      double.parse(
                                                          targetweight);
                                                    } catch (e) {
                                                      // 匹配所以类型的异常. e是异常对象，r是StackTrace对象，异常的堆栈信息
                                                      print('wrong');
                                                      flag = false;
                                                    }
                                                    if (flag) {
                                                      nums = double.parse(
                                                          targetweight);
                                                      if (nums > 40 &&
                                                          nums < 300) {
                                                        Provider.of<Counter>(
                                                                context)
                                                            .targetWeight(
                                                                targetweight);
                                                        // eventBus.fire(new GetWeight(weight));
                                                        _toast(
                                                            'Added Successfully',
                                                            Colors.black);
                                                        Navigator.pop(context);
                                                      } else {
                                                        _toast(
                                                            'Weight should be greater than 40 kg and less than 300 kg',
                                                            Colors.red);
                                                      }
                                                    } else {
                                                      _toast('Wrong weight ',
                                                          Colors.red);
                                                    }
                                                  } else {
                                                    _toast('Wrong weight ',
                                                        Colors.red);
                                                  }
                                                },
                                                child: Container(
                                                  // color: Colors.blue,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff232d37),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15.0),
                                                      )
                                                      // shape: BoxShape.circle
                                                      ),
                                                  child: Center(
                                                    child: Text(
                                                      'add',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ));
                                    });
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Target weight',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    targetweight == null
                                        ? 'nothing'
                                        : targetweight,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Range target',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  rangeweight == null ? 'nothing' : rangeweight,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
          // FlatButton(
          //   onPressed: () {
          //     print('object');
          //     setState(() {
          //       startdate = startdate.subtract(Duration(days: 7));
          //     });
          //   },
          //   child: Icon(Icons.arrow_back),
          // ),
        ],
      ),
    ));
  }
}

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class LineChartPage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     List<Color> gradientColors = [
//       // Color(0xff23b6e6),
//       // Color(0xff02d39a),
//       Colors.blue,
//       Colors.blueAccent,
//     ];
//     return
//     Center(
//       child:     SafeArea(
//       child:AspectRatio(
//       aspectRatio: 0.8,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(18)),
//           color: Color(0xff232d37)
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
//           child: FlChart(
//             chart: LineChart(
//               LineChartData(
//                 gridData: FlGridData(
//                   show: true,
//                   drawHorizontalGrid: true,
//                   getDrawingVerticalGridLine: (value) {
//                     return const FlLine(
//                       color: Color(0xff37434d),
//                       strokeWidth:  1,
//                     );
//                   },
//                   getDrawingHorizontalGridLine: (value) {
//                     return const FlLine(
//                       color: Color(0xff37434d),
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 22,
//                     textStyle: TextStyle(
//                       color: const Color(0xff68737d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16
//                     ),
//                     getTitles: (value) {
//                       switch(value.toInt()) {
//                         case 2: return 'MAR';
//                         case 4: return 'JUN';
//                         case 6: return 'SEP';
//                         case 8: return 'SEP';
//                         case 10: return 'SEP';
//                       }

//                       return '';
//                     },
//                     margin: 8,
//                   ),
//                   leftTitles: SideTitles(
//                     showTitles: true,
//                     textStyle: TextStyle(
//                       color: const Color(0xff67727d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                     getTitles: (value) {
//                       switch(value.toInt()) {
//                         case 50: return '40kg';
//                         case 50: return '50kg';
//                         case 60: return '60kg';
//                         case 70: return '70kg';
//                         case 80: return '80kg';
//                         case 90: return '90kg';
//                       }
//                       return '';
//                     },
//                     reservedSize: 28,
//                     margin: 12,
//                   ),
//                 ),
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(color: Color(0xff37434d), width: 1)
//                 ),
//                 minX: 0,
//                 maxX: 10,
//                 minY: 40,
//                 maxY: 90,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: [
//                       FlSpot(0, 75),
//                       FlSpot(2, 75),
//                       FlSpot(4, 76),
//                       FlSpot(6, 75.8),
//                       FlSpot(8, 75),
//                       FlSpot(10, 75),
//                     ],
//                     isCurved: true,
//                     colors: gradientColors,
//                     barWidth: 5,
//                     isStrokeCapRound: true,
//                     dotData: FlDotData(
//                       show: true,
//                     ),
//                     belowBarData: BelowBarData(
//                       show: true,
//                       colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ))
//     );

//   }

// }