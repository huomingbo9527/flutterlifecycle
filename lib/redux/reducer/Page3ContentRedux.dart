import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

/**
 * 事件Redux
 * Created by guoshuyu
 * Date: 2018-07-16
 */

///通过 flutter_redux 的 combineReducers，实现 Reducer 方法
final Page3ContentReducer = combineReducers<String>([
  ///将 Action 、处理 Action 的方法、State 绑定
  TypedReducer<String, UpdateContentAction3>((content,action){
    return action.content;
  }),
//      (content,action){  不会报错，但是如果不确定方法的类型  很肯能和其他的方法弄混例如：和UpdateContentAction弄混，两个action都是操作单字符串
//    return action.content;
//  },
]);
//final Page3ContentReducer =  (content,action){///可以执行成功
//    return action.content;
//};

//
/////定义处理 Action 行为的方法，返回新的 State
//String _refresh(String content, action) {
//  content = action.content;
//  return content;
//}

///定义一个 Action 类
///将该 Action 在 Reducer 中与处理该Action的方法绑定
class UpdateContentAction3 {

  final String content;

  UpdateContentAction3(this.content);
}
