import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class StatelessContainer extends StatelessWidget {
  final Color color = RandomColor().randomColor();
  StatelessContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(///调试断点
      width: 50,
      height: 50,
      color: color,
    );
  }
}


class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key}) : super(key: key);
  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(///调试断点
      width: 50,
      height: 50,
      color: color,
    );
  }
}