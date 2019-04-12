import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/page5.dart';
import 'package:random_color/random_color.dart';

class Page4 extends StatefulWidget {
  Page4({Key key, this.title = "Page4"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> with WidgetsBindingObserver{
  int _counter = 0;

  @override
  void initState() {
    print("Page4   initState ----------------------- ");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("Page4   dispose ");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("Page4   didChangeDependencies ");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Page4 oldWidget) {
    // TODO: implement didUpdateWidget
    print("Page4   didUpdateWidget  $oldWidget");
    super.didUpdateWidget(oldWidget);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Page4   didChangeAppLifecycleState  $state");
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  void _incrementCounter() {
//    while(Navigator.of(context).canPop()){
//      Navigator.of(context).pop();
//    }
//  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
//      return Page5();
//    }), ModalRoute.withName("/"));
//    setState(() {
//      _counter++;
//    });
  }

//  @override
//  Widget build(BuildContext context) {
//    print("Page4   build ");
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'page444444444444:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }

  List<Widget> widgets = [
    StatelessContainer(),
    StatelessContainer(),
  ];

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

  switchWidget() async {
//    MediaQueryData.fromWindow(window)
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}


class StatelessContainer extends StatelessWidget {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}


class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key}) : super(key: key);
  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}