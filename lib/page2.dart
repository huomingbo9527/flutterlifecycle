import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/page3.dart';


class Page2 extends StatefulWidget {
  Page2({Key key, this.title = "Page2"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with WidgetsBindingObserver{
  int _counter = 0;

  @override
  void initState() {
    print("Page2   initState ----------------------- ");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("Page2   dispose ");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("Page2   didChangeDependencies ");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Page2 oldWidget) {
    // TODO: implement didUpdateWidget
    print("Page2   didUpdateWidget  $oldWidget");
    super.didUpdateWidget(oldWidget);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Page2   didChangeAppLifecycleState  $state");
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  void _incrementCounter() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Page3();
    }));
//    setState(() {
//      _counter++;
//    });
  }

  @override
  Widget build(BuildContext context) {
    print("Page2   build ");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'page222222222:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
