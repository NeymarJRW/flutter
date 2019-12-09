import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  NotePage({Key key}) : super(key: key);

  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoActionSheet(
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('data'),
                    ),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('data'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('data'),
                      ),
                    ],
                  );
                });
          },
          child: Text('data'),
        ),
      ),
    );
  }
}

// CupertinoActionSheet(
//   cancelButton: CupertinoActionSheetAction(
//     onPressed: () {
//       Navigator.pop(context);
//     },
//     child: Text('data'),
//   ),
//   actions: <Widget>[
//     CupertinoActionSheetAction(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       child: Text('data'),
//     ),
//     CupertinoActionSheetAction(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       child: Text('data'),
//     ),
//   ],
// );
