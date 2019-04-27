import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/key/StatelessContainer.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

//  List<Widget> widgets = [///颜色可切换，StatelessContainer没有执行的build，只是调换了位置
////    StatelessContainer(key: UniqueKey()),
////    StatelessContainer(key: UniqueKey()),
////  ];
//
//  List<Widget> widgets = [///颜色可切换，Element的位置没有改变，这是更新了widget,执行的build
//    StatelessContainer(),
//    StatelessContainer(),
//  ];
//
//  List<Widget> widgets = [///颜色不可切换，Element的位置没有改变，element持有state,即便是更新了widget，但是调用的是state的build,所以样色没有切换
//    StatefulContainer(),
//    StatefulContainer(),
//  ];
//
//  List<Widget> widgets = [///颜色可切换，Element的位置改变，element持有state,调用的是state的build,所以颜色切换了
//    ///在更新的时候调用widget的canUpdate方法，比较的是widget的type和key,key不一样导致不能更细，所以通过key在同级别的widget内查找，找到了拿过来，未找到就创建一个新的
//    StatefulContainer(key: UniqueKey()),
//    StatefulContainer(key: UniqueKey()),
//  ];
//
//  List<Widget> widgets = [///颜色不可切换，Element的位置没有改变，element持有state,即便是更新了widget，但是调用的是state的build,所以样色没有切换
//    Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulContainer(),
//    ),
//    Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulContainer(),
//    ),
//  ];
//
  List<Widget> widgets = [///颜色随机更换，虽然padding的type和key是一样的，执行更新操作，padding是单个子widget,判断可更新的时候，由于key不一样，要重新创建
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer( key: UniqueKey(),),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer( key: UniqueKey(),),
    ),
  ];
//
//  List<Widget> widgets = [///颜色可切换，Element的位置改变，两个element位置掉换了
//    Padding(
//      key: UniqueKey(),
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulContainer( key: UniqueKey(),),
//    ),
//    Padding(
//      key: UniqueKey(),
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulContainer( key: UniqueKey(),),
//    ),
//  ];

//  List<Widget> widgets = [
//    Row(
//      children: <Widget>[
//        StatefulContainer(),
//        StatefulContainer(),
//        StatefulContainer(),
//      ],
//    ),
//    Row(
//      children: <Widget>[
//        StatefulContainer(),
//        StatefulContainer(),
////        StatefulContainer(key: UniqueKey())
//      ],
//    )
//  ];
//
//  List<Widget> widgets = [
//    Padding(
////  key: UniqueKey(),
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulContainer( key: UniqueKey(),),
//    ),
//    Padding(
////  key: UniqueKey(),
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulContainer( key: UniqueKey(),),
//    ),
//  ];
  @override
  void didUpdateWidget(Screen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget(){
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}
