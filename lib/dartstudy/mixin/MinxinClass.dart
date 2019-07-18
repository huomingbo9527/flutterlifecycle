

import 'ByMinxin.dart';

mixin MinxinClass on ByMinxin{

//  int testMinMethod(){
////    return 2;
////  }

//  int testMinMethod2(){
//    return 3;
//  }

}
///extends:要实现with(多个with 如果方法名字相同一个实现了即可) 与 implements 所有未实现方法
///实现方法调用顺序：1,如果方法名字相同切返回值相同的话，implements类的方法一定不会调用.
///                2,子类>with(with后面的>前面的)>extends
class TestMiXinClass extends ByMinxin  with TestMiXinAbsClass ,MinxinClass implements TestMiXinAbsClass2{

  @override
  int testMinMethod() {
    return 4;
  }



  @override
  void testAbsMethod2() {

  }

  @override
  int testAbsMethod() {
    return null;
  }

  @override
  int name1;


}

abstract class TestMiXinAbsClass{
  int testAbsMethod();

  int testMinMethod2(){
    return 6;
  }
}

abstract class TestMiXinAbsClass2{
  void testAbsMethod(){}
  void testAbsMethod2();
  int testMinMethod2(){
    return 7;
  }
}
///implements:实现类要将所有的父类方法和属性都要实现，包括父类继承其他类的的或者父类实现其他类的方法都要实现。
class TestImpl implements TestMiXinClass{
  @override
  int testAbsMethod() {
    // TODO: implement testAbsMethod
    return null;
  }

  @override
  void testAbsMethod2() {
    // TODO: implement testAbsMethod2
  }

  @override
  int testMinMethod() {
    // TODO: implement testMinMethod
    return null;
  }

  @override
  int testMinMethod2() {
    // TODO: implement testMinMethod2
    return null;
  }

  @override
  int name1;

}


testMixin(){
  TestMiXinClass testMiXinClass = TestMiXinClass();
  ByMinxin byMinxin = ByMinxin();

  print(testMiXinClass.testMinMethod());
  print(testMiXinClass.testMinMethod2());
  print(testMiXinClass.testAbsMethod());


  print(byMinxin.testMinMethod());


}

