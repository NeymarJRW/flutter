import 'package:event_bus/event_bus.dart';
// import 'package:flutter/cupertino.dart';
EventBus eventBus=EventBus();
//语句切换
class ChangeTitle{

}

// 变换背景
class ChangeBg{
  int nums;
  ChangeBg(int nums){
    this.nums=nums;
  }
}

//显示选项
class Showselect{
  List list;
  Showselect(List list){
    this.list=list;
  }
}

//选项分流
class Selectafter{
  int listindex;
  Selectafter(int listindex){
    this.listindex=listindex;
  }
}

//重新开始
class Resetgame{

}

//重新开始是隐藏选项
class Hideselect{


}
//请求存档
class Savadatarequest{

}

//发送存档的数组和index
class Sendsavedata{
  List list;
  int index;
  Sendsavedata(List list,int index){
    this.list=list;
    this.index=index;
  }
}