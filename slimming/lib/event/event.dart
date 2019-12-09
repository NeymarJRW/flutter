import 'package:event_bus/event_bus.dart';

//Bus初始化
EventBus eventBus = EventBus();

class GetWeight {
  String weight;
  GetWeight(this.weight);
}
class TargetWeight {
 String weight;
  TargetWeight(this.weight);
  // SaveDate(this.weight);
}
