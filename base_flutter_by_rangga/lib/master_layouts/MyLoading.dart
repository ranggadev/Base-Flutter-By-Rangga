import 'package:base_flutter_by_rangga/common/MyColor.dart';
import 'package:base_flutter_by_rangga/common/MyHelper.dart';
import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {

  final double height, width;
  final Color color;

  const MyLoading({Key key, this.height = 20.0, this.width = 20.0, this.color = Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: height,
          width: width,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        )
    );
  }
}