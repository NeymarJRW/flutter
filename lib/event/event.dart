import 'package:event_bus/event_bus.dart';

//Bus初始化
EventBus eventBus = EventBus();

class GetDate {
  DateTime time;
  String weight;
  GetDate(DateTime time,String weight) {
    this.time = time;
    this.weight = weight;
  }
}