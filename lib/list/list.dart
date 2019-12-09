import 'package:flutter/material.dart';
import '../event/event.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String weight;
  String time;
  void _listen() {
    eventBus.on<GetDate>().listen((event) {
      print(event.time);
      setState(() {
        time=event.time.year.toString()+'-'+event.time.month.toString()+'-'+event.time.day.toString();
        weight=event.weight;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    _listen();
    return SafeArea(
        child: Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // color: Colors.red,
              child: Center(
                child: Text(weight==null ? 'no weight' : weight+'KG' ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              // color: Colors.blue,
              child: Center(
                child: Text(time==null ? 'no days' :  time),
              ),
            ),
            flex: 2,
          ),
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
