


//mixin MinxinClass on ByMinxin{
//
//  int testMinMethod(){
//    return 2;
//  }
//
//  int testMinMethod2(){
//    return 3;
//  }
//}

class TestMiXinClass with TestMiXinAbsClass1,TestMiXinAbsClass2,TestMiXinAbsClass3{
  String txt = "txt";
}

abstract class TestMiXinAbsClass{
  String txt0 = "txt0";
}

abstract class TestMiXinAbsClass1{
  String txt1 = "txt1";
}

abstract class TestMiXinAbsClass2{
  String txt2 = "txt2";
}

abstract class TestMiXinAbsClass3{
  String txt3 = "txt3";
}


testMixin2(){
  TestMiXinClass testMiXinClass = TestMiXinClass();

  print(testMiXinClass.txt);
//  print(testMiXinClass.txt0);
  print(testMiXinClass.txt1);
  print(testMiXinClass.txt2);
  print(testMiXinClass.txt3);

}

