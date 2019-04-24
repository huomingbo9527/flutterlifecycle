import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/page3.dart';
import 'package:flutter_lifecycle/redux/IState.dart';
import 'package:flutter_lifecycle/redux/reducer/Page3ContentRedux.dart';
import 'package:flutter_lifecycle/redux/reducer/PageContentRedux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class ReduxPage3 extends StatefulWidget {
  ReduxPage3({Key key, this.title = "Page3"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ReduxPage3State createState() => _ReduxPage3State();
}

class _ReduxPage3State extends State<ReduxPage3> with WidgetsBindingObserver{
  int _counter = 1;

  @override
  void initState() {
    print("ReduxPage3   initState ----------------------- ");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("ReduxPage3   dispose ");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("ReduxPage3   didChangeDependencies ");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ReduxPage3 oldWidget) {
    // TODO: implement didUpdateWidget
    print("ReduxPage3   didUpdateWidget  $oldWidget");
    super.didUpdateWidget(oldWidget);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("ReduxPage3   didChangeAppLifecycleState  $state");
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  void _incrementCounter() {
    _counter ++;
    Store<IState> store = StoreProvider.of(context);
    store.dispatch(UpdateContentAction3("redux 更新 ReduxPage3"));
  }

  @override
  Widget build(BuildContext context) {
    print("ReduxPage3   build ");
    return StoreBuilder<IState>(
        onInit: (s){
          print("ReduxPage3   StoreBuilder  onInit ---------------- $s"); ///第一次初始化调用
        },
        onInitialBuild: (s){
          print("ReduxPage3   StoreBuilder  onInitialBuild ----------------$s");///第一次build之后调用
        },
        onWillChange: (s){
          print("ReduxPage3   StoreBuilder  onWillChange ----------------$s");///界面重新build之前调用
        },
        onDidChange: (s){
          print("ReduxPage3   StoreBuilder  onDidChange ----------------$s");///界面重新build后调用
        },
        onDispose: (s){
          print("ReduxPage3   StoreBuilder  onDispose ---------------- $s");///界面dispose调用，在界面调用dispose方法之前调用
        },
        rebuildOnChange: true, ///设置是否随着改变进行重构，false不重构界面，默认都是true
        builder: (context, store) {
          IState iState = store.state;
          print("ReduxPage3   StoreBuilder  builder $iState");
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _getChildren(iState),
//                <Widget>[
//                  Text(
//                    iState.content3,
//                  ),
//                  Text(
//                    '$_counter',
//                    style: Theme
//                        .of(context)
//                        .textTheme
//                        .display1,
//                  ),
//                ],
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
  _getChildren(iState){
    List<Widget> list = [];
    for(int i = 0;i<_counter;i++){
      list.add(Text(
        iState.content3,
      ));
    }
    return list;
  }
}
