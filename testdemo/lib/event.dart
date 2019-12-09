      import 'package:event_bus/event_bus.dart';

      //Bus初始化
      EventBus eventBus = EventBus();

      class Pageindex {
        int index;
        Pageindex(int index) {
          this.index = index;
        }
      }