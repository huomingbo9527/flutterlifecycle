

testListHuo(){
  // 非固定长度
  var testList = List();
// 也可以 List testList = List();
  print(testList.length); // 0
// 固定长度
  var fixedList = List(2);
  print(testList.length); // 2

  testList.add("hello world");
  testList.add(123);
  print(testList.length); // 2
  print(testList);

//  fixedList.add(1); // 报错。固定长度不能添加元素
  fixedList[0] = 123;
  fixedList[1] = "hello world";
  print(fixedList.length); // 2
  print(fixedList);

// 元素类型固定
  var typeList = List<String>(); // 只能添加字符串类型的元素
//  typeList.add(1); // 错误。类型不正确
  typeList.add("hello world"); // 正确
  typeList.add("a"); // 正确
  typeList.add("b"); // 正确
  print(typeList.length);
  print(typeList);
  typeList.sort((a,b)=>a.compareTo(b));
  print(typeList);


// 直接赋值
  var numList = [1, 2, 3];
//  numList.add("hello world"); // 错误，类型不正确
  var dyList = [true, 'hello world', 1];
  dyList.add(1.2); // 正确
  print(dyList.length); // 4
  print(dyList);


// length 属性，返回队列长度
  print(testList.length); // 3
// isEmpty 属性，返回队列是否为空
  print(testList.isEmpty); // false
// 添加元素
  testList.add(4);
  print(testList); // [1, '2', 3.1, 4]

// 删除元素
  testList.remove(123);
  print(testList); // [1, '2', 4]
  testList.remove(123);

// 元素索引. 列表的索引从0开始
  print(testList.indexOf(4)); // 1
  print(testList.indexOf(1)); // -1
}


testSetHuo(){
  var testSet = new Set();
  var testSet1 = new Set();
  var testSet2 = new Set();
//  var testSet2 = new Set(2); // 错误，Set没有固定元素的定义

  print(testSet.length); // 0

  testSet.add(1);
  testSet.add(1); // 重复元素无效
  testSet.add("a");
  testSet.add("a"); // 重复元素无效
//  testSet.add(testSet1);
//  testSet.add(testSet1);
//  testSet.add(testSet2);
  print(testSet); // {1, "a"}

  print(testSet.contains(1)); // true

  testSet.addAll(['b', 'c']);

  print(testSet); // (1, 'a', 'b', 'c')

  testSet.remove('b');
  print(testSet); // (1, 'a', 'c')
}


testMapHuo(){

  // 常用的两种定义方式
  var testMap = Map();

  var testMap2 = {
    "a": "this is a",
    "b": "this is b",
    "c": "this is c"
  };

// 长度属性
  print(testMap.length); // 0
// 获取值
  print(testMap2["a"]); // this is a
// 如果没有key,返回null
  print(testMap["a"]); // null
  testMap["123"] = "1234";
  testMap[true] = "false";
  print(testMap.keys);
  print(testMap.values);

// 需要注意的是keys 和 values 是属性不是方法
  print(testMap2.keys); // 返回所有key
  print(testMap2.values); // 返回左右value

// key:value 的类型可以指定
  var intMap = Map<int, String>();
// map新增元素
  intMap[1] = "Num 1"; // true
//  intMap['a'] = "Char a:; // 错误，类型不正确。
  intMap[2] = "Num 2";
// 删除元素
  intMap.remove(2);
// 是否存在key
  print(intMap.containsKey(1)); // true
  print(intMap.containsKey(2)); // false

  testMap2.entries.firstWhere((res){

  });
  RegExp('123');
}



