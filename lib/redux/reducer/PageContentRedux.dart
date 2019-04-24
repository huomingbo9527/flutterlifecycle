import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

/**
 * 事件Redux
 * Created by guoshuyu
 * Date: 2018-07-16
 */
//
///通过 flutter_redux 的 combineReducers，实现 Reducer 方法
final PageContentReducer = combineReducers<String>([
  ///将 Action 、处理 Action 的方法、State 绑定
  TypedReducer<String, UpdateContentAction>(_refresh),
]);
//这样不会报错会报错 Class 'UpdateContentAction3' has no instance getter 'content1'.
//final PageContentReducer = (content,action){///可以执行成功
//  return action.content1;
//};

///定义处理 Action 行为的方法，返回新的 State
String _refresh(String content, action) {
  content = action.content;
  return content;
}
//
///定义一个 Action 类
///将该 Action 在 Reducer 中与处理该Action的方法绑定
class UpdateContentAction {

  final String content;

  UpdateContentAction(this.content);
}
