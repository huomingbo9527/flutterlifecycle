import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_account/account/AccountRoute.dart';
import 'package:flutter_account/account/style/AccountStrings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_package/common/event/HttpErrorEvent.dart';
import 'package:flutter_package/common/localization/IHealthLocalizationsDelegate.dart';
import 'package:flutter_package/common/net/Code.dart';
import 'package:flutter_package/common/utils/essential.dart';
import 'package:flutter_shop/shop/ShopRoute.dart';
import 'package:flutter_shop/shop/style/ShopStrings.dart';
import 'dart:async';
import 'FirstTestPage.dart';
//void main(){
//  start();
//}

void startModule() async{
  runApp(createApp());
}
//final AbstractRoutes allRoutes = HybridRoutes(routes: <AbstractRoutes>[
//  AccountRoute.route,
//  MainRoute.route,
//  BloodGlucoseRoute.route,
//  ShopRoute.route,
//  SubsequentRoute.route,
//]);
final AbstractRoutes allRoutes = PageRoutes(
    pages:
    AccountRoute.routeMap
      ..addAll(ShopRoute.routeMap)
//        ..addAll(SubsequentRoute.routeMap)
);

//final AbstractRoutes allRoutes = PageRoutes(pages: <String, Page<Object, dynamic>>{
////"splashPage": SplashPage(),
////"loginPage" : LoginPage(),
//AccountRoute.routeMap,
//MainRoute.route,
////BloodGlucoseRoute.route,
//ShopRoute.route,
//SubsequentRoute.route,
//});
final Map<String,String> allZHStrings = APPStrings.stringMap..addAll(AccountStrings.stringZHMap)..addAll(ShopStrings.stringZHMap);
final Map<String,String> allENStrings = APPStrings.stringMap..addAll(AccountStrings.stringENMap)..addAll(ShopStrings.stringENMap);


Widget createApp() {
  return IHealthApp();
}

class IHealthApp extends StatelessWidget {
  IHealthApp();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      ///多语言实现代理
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,//时间数字等等的国际话
        GlobalWidgetsLocalizations.delegate,//语言的方向  沙特等国家的处理
        IHealthLocalizationsDelegate.delegate..initStrings(allZHStrings, allENStrings),//本地语言国家化
        const FallbackCupertinoLocalisationsDelegate(),
      ],
      supportedLocales: [//支持语言 这一个要写 要不默认显示英语
        const Locale('en', 'US'),
        const Locale('zh', 'CH'),//打开后长按输入框崩溃
      ],
      title: '与糖',
      home:GSYLocalizations(
        child:  FirstTestPage(),//allRoutes.buildPage(AccountRoute.loginPage, null),
      ),
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation) {
          // 跳转的路由对象
          return allRoutes.buildPage(settings.name, settings.arguments);
        }, transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,) {
          return NavigatorUtils.createTransition(animation, child,settings.name);
        });

//        return MaterialPageRoute<Object>(builder: (BuildContext context) {
//          return routes.buildPage(settings.name, settings.arguments);
//        });
      },
    );
  }
}

//处理meterial调用Cupertino dialog 崩溃问题
class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class GSYLocalizations extends StatefulWidget {
  final Widget child;

  GSYLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<GSYLocalizations> createState() {
    return new _GSYLocalizations();
  }
}

class _GSYLocalizations extends State<GSYLocalizations> {
  StreamSubscription stream;
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    stream =  Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void didChangeDependencies() {
    ScreenUtil.instance = ScreenUtil()..init(context);
    logV(ScreenUtil.instance.toString());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    if(stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.CODE_SUBSEQUENT_CANCEL://业务提示  不提示网络问题
      case Code.CODE_SUBSEQUENT_IMG_VERIFY://图片验证失败
      case Code.CODE_SUBSEQUENT_ORDER_INVALID://预约已无效
      case Code.CODE_SUBSEQUENT_ORDER_FULL://爽约次数已满
        break;

      case Code.CODE_NETWORK_ERROR_NO_CONNECT:
        showToast(getLocale(context).value(AccountStrings.toastNetwrokError));
        break;
      case Code.CODE_NETWORK_ERROR_REQUEST:
        showToast(getLocale(context).value(AccountStrings.toastRequestError));
        break;
      default:
        showToast(getLocale(context).value(AccountStrings.toastRequestError));
        break;
    }
  }
}


class HybridRoutes implements AbstractRoutes {
  final List<AbstractRoutes> routes;

  const HybridRoutes({
    @required this.routes,
  }) : assert(routes != null);

  @override
  Widget buildPage(String path, dynamic arguments) {
    for (AbstractRoutes aRoutes in routes) {
      final Widget result = aRoutes.buildPage(path, arguments);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}