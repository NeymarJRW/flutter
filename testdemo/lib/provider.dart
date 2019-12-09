    import 'package:flutter/material.dart';
    class Counter with ChangeNotifier {
      String _title = 'data'; 
      void change( String str ) {
           _title=str;
      }
      get title => _title; 

    }