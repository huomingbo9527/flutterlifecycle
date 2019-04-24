import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/page3.dart';
import 'package:flutter_lifecycle/redux/IState.dart';
import 'package:flutter_lifecycle/redux/reducer/PageContentRedux.dart';
import 'package:flutter_lifecycle/redux/reduxPage3.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class ReduxPage2 extends StatefulWidget {
  ReduxPage2({Key key, this.title = "Page2"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ReduxPage2State createState() => _ReduxPage2State();
}

class _ReduxPage2State extends State<ReduxPage2> with WidgetsBindingObserver{
  int _counter = 0;

  @override
  void initState() {
    print("ReduxPage2   initState ----------------------- ");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("ReduxPage2   dispose ");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("ReduxPage2   didChangeDependencies ");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ReduxPage2 oldWidget) {
    // TODO: implement didUpdateWidget
    print("ReduxPage2   didUpdateWidget  $oldWidget");
    super.didUpdateWidget(oldWidget);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("ReduxPage2   didChangeAppLifecycleState  $state");
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  void _incrementCounter() {
//    Store<IState> store = StoreProvider.of(context);
//    store.dispatch(UpdateContentAction("redux 更新 content"));
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ReduxPage3();
    }));
  }

  @override
  Widget build(BuildContext context) {
    print("ReduxPage2   build ");
    return StoreBuilder<IState>(
        builder: (context, store) {
          IState iState = store.state;
          print("ReduxPage2   StoreBuilder  builder $iState");
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    iState.content,
                  ),
                  Text(
                    '$_counter',
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1,
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
    );
  }
}
