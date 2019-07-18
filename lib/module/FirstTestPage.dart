import 'package:flutter/material.dart';
import 'package:flutter_account/account/AccountRoute.dart';
import 'package:flutter_account/account/style/AccountStrings.dart';
import 'package:flutter_package/common/utils/essential.dart';
import 'package:flutter_shop/shop/ShopRoute.dart';
//import 'package:patient_im/page/im_conversation.dart';
import 'main.dart';
class FirstTestPage extends StatefulWidget{
  FirstTestPage();

  @override
  State<StatefulWidget> createState() {
    return _FirstTestPageState();
  }
}

class _FirstTestPageState extends State<FirstTestPage> with WidgetsBindingObserver{
  _FirstTestPageState();

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: (){
//            Navigator.push(context,
//                new PageRouteBuilder(pageBuilder: (BuildContext context,
//                    Animation<double> animation,
//                    Animation<double> secondaryAnimation) {
//                  // 跳转的路由对象
//                  return Conversation();
//                }));allRoutes
//            allRoutes.buildPage(ShopRoute.shopList, "123");
            Navigator.of(context)//AccountRoute.splashPage    ShopRoute.shopList
                .pushNamed(AccountRoute.splashPage, arguments: null)
                .then((dynamic toDo) {
//              Navigator.of(context)//AccountRoute.splashPage    ShopRoute.shopList
//                  .pushNamed(ShopRoute.shopList, arguments: null)
//                  .then((dynamic toDo) {
////              if (toDo != null &&
////                  (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
////                ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
////              }
//              });
            });
          },
          child: Center(
            child: IHealthConstant.getTextContentTitle("123"),//getLocale(context).value(AccountStrings.app_ok)
          ),
        ),
      );
  }

}