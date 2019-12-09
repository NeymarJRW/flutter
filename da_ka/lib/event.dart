import 'package:event_bus/event_bus.dart';

//Bus初始化
EventBus eventBus = EventBus();

class UserThemeEvent {
  String text;
  UserThemeEvent(String text){
    this.text = text;
  }
}