// Column(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               // color: Colors.red,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('images/bg.jpg'), fit: BoxFit.none)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         '2 days have been recorded',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                     flex: 1,
//                   ),
//                   weight == null
//                       ? Expanded(
//                           child: Center(
//                               child: Container(
//                             width: 320,
//                             // color: Colors.red,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 Expanded(
//                                   child: Column(
//                                     children: <Widget>[
//                                       Text(
//                                         'Unrecorded',
//                                         style: TextStyle(
//                                             fontSize: 15, color: Colors.white),
//                                       ),
//                                       Text(
//                                         'today!',
//                                         style: TextStyle(
//                                             fontSize: 15, color: Colors.white),
//                                       )
//                                     ],
//                                   ),
//                                   flex: 1,
//                                 ),
//                               ],
//                             ),
//                           )),
//                           flex: 2,
//                         )
//                       : Expanded(
//                           child: Center(
//                             child: Column(
//                               children: <Widget>[
//                                 SizedBox(
//                                   height: 25,
//                                 ),
//                                 Center(
//                                   child: Text('Recorded',
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 12)),
//                                 ),
//                                 Center(
//                                   child: Text(
//                                       weight == null ? 'no weight' : weight,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 25)),
//                                 ),
//                                 Center(
//                                   child: Text('KG',
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 10)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           flex: 2,
//                         ),
//                   Expanded(
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             child: Column(
//                               children: <Widget>[
//                                 Text(
//                                   'with last time',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 Text(
//                                   '1.5',
//                                   style: TextStyle(color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                             flex: 1,
//                             child: FlatButton(
//                               onPressed: () {
//                                 showModalBottomSheet(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return Container(
//                                           height: 400,
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 30.0),
//                                           child: Column(
//                                             children: <Widget>[
//                                               Row(
//                                                 children: <Widget>[
//                                                   Expanded(
//                                                     child: Text(''),
//                                                     flex: 3,
//                                                   ),
//                                                   Expanded(
//                                                     child: FlatButton(
//                                                       onPressed: () {
//                                                         Navigator.pop(context);
//                                                       },
//                                                       child: ClipOval(
//                                                         child: Container(
//                                                           color:
//                                                               Color(0xff232d37),
//                                                           child: Icon(
//                                                             Icons.close,
//                                                             color: Colors.white,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 height: 10,
//                                               ),
//                                               Container(
//                                                 padding: EdgeInsets.symmetric(
//                                                     horizontal: 18.0),
//                                                 child: TextField(
//                                                   onChanged: _controllerchange,
//                                                   controller: _controller,
//                                                   decoration: InputDecoration(
//                                                       //  helperText: 'KG',
//                                                       suffixText: 'KG',
//                                                       prefixIcon: Icon(
//                                                           Icons.local_airport),
//                                                       hintText:
//                                                           'Your weight today',
//                                                       // contentPadding: new EdgeInsets.all(0.0),
//                                                       border:
//                                                           OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                             color: Colors.blue),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(15.0),
//                                                       )),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 20,
//                                               ),
//                                               FlatButton(
//                                                 onPressed: () {
//                                                   if (targetweight != null) {
//                                                     bool flag = true;
//                                                     double nums;
//                                                     try {
//                                                       double.parse(
//                                                           targetweight);
//                                                     } catch (e) {
//                                                       // 匹配所以类型的异常. e是异常对象，r是StackTrace对象，异常的堆栈信息
//                                                       print('wrong');
//                                                       flag = false;
//                                                     }
//                                                     if (flag) {
//                                                       nums = double.parse(
//                                                           targetweight);
//                                                       if (nums > 40 &&
//                                                           nums < 300) {
//                                                         Provider.of<Counter>(
//                                                                 context)
//                                                             .targetWeight(
//                                                                 targetweight);
//                                                         // eventBus.fire(new GetWeight(weight));
//                                                         _toast(
//                                                             'Added Successfully',
//                                                             Colors.black);
//                                                         Navigator.pop(context);
//                                                       } else {
//                                                         _toast(
//                                                             'Weight should be greater than 40 kg and less than 300 kg',
//                                                             Colors.red);
//                                                       }
//                                                     } else {
//                                                       _toast('Wrong weight ',
//                                                           Colors.red);
//                                                     }
//                                                   } else {
//                                                     _toast('Wrong weight ',
//                                                         Colors.red);
//                                                   }
//                                                 },
//                                                 child: Container(
//                                                   // color: Colors.blue,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       color: Color(0xff232d37),
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                         Radius.circular(15.0),
//                                                       )
//                                                       // shape: BoxShape.circle
//                                                       ),
//                                                   child: Center(
//                                                     child: Text(
//                                                       'add',
//                                                       style: TextStyle(
//                                                           color: Colors.white),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           ));
//                                     });
//                               },
//                               child: Column(
//                                 children: <Widget>[
//                                   Text(
//                                     'Target weight',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   Text(
//                                     targetweight == null
//                                         ? 'nothing'
//                                         : targetweight,
//                                     style: TextStyle(color: Colors.white),
//                                   )
//                                 ],
//                               ),
//                             )),
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             child: Column(
//                               children: <Widget>[
//                                 Text(
//                                   'Range target',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 Text(
//                                   rangeweight == null ? 'nothing' : rangeweight,
//                                   style: TextStyle(color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     flex: 1,
//                   ),
//                 ],
//               ),
//             ),
//             flex: 1,
//           ),
//           SizedBox(
//             height: 10,
//           )
//           // FlatButton(
//           //   onPressed: () {
//           //     print('object');
//           //     setState(() {
//           //       startdate = startdate.subtract(Duration(days: 7));
//           //     });
//           //   },
//           //   child: Icon(Icons.arrow_back),
//           // ),
//         ],
//       ),