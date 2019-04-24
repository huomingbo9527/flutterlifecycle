import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/redux/reducer/LocaleRedux.dart';
import 'package:flutter_lifecycle/redux/reducer/Page3ContentRedux.dart';
import 'package:flutter_lifecycle/redux/reducer/PageContentRedux.dart';
import 'package:flutter_lifecycle/redux/reducer/ThemeRedux.dart';

///全局Redux store 的对象，保存State数据
class IState {

  ///主题数据
  ThemeData themeData;

  ///语言
  Locale locale;

  ///当前手机平台默认语言
  Locale platformLocale;
  ///界面显示的内容
  String content;
  ///界面显示的内容
  String content3;
//
//  ///构造方法
//  IHealthState({
//    this.userInfo,
//    this.eventList,
//    this.themeData,
//    this.locale,
//    this.platformLocale,
//    this.shopOrderList
//  });


  IState({this.themeData, this.locale, this.platformLocale, this.content,this.content3});

  IState copyWith({String content, String content3, ThemeData themeData,Locale locale,Locale platformLocale}) {
    return new IState(
      content: content ?? this.content,
      content3: content3 ?? this.content3,
      themeData: themeData ?? this.themeData,
      locale: locale ?? this.locale,
      platformLocale: platformLocale ?? this.platformLocale,
    );
  }

  @override
  String toString() {
    return 'IState{content: $content, content3: $content3}';
  }


}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
IState appReducer(IState state, action) {
  return IState(
    content3:Page3ContentReducer(state.content3,action),
    content:PageContentReducer(state.content,action),
    ///通过 ThemeDataReducer 将 GSYState 内的 themeData 和 action 关联在一起
    themeData: ThemeDataReducer(state.themeData, action),

    ///通过 LocaleReducer 将 GSYState 内的 locale 和 action 关联在一起
    locale: LocaleReducer(state.locale, action),

  );
}
