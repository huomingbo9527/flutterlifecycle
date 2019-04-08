import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/page4.dart';


class Page3 extends StatefulWidget {
  Page3({Key key, this.title = "Page3"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with WidgetsBindingObserver{
  int _counter = 0;

  @override
  void initState() {
    print("Page3   initState ----------------------- ");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("Page3   dispose ");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("Page3   didChangeDependencies ");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Page3 oldWidget) {
    // TODO: implement didUpdateWidget
    print("Page3   didUpdateWidget  $oldWidget");
    super.didUpdateWidget(oldWidget);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Page3   didChangeAppLifecycleState  $state");
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  void _incrementCounter() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Page4();
    }));
//    setState(() {
//      _counter++;
//    });
  }

  @override
  Widget build(BuildContext context) {
    print("Page3   build ");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'page3333333333:',
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
