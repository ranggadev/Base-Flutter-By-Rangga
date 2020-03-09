import 'package:base_flutter_by_rangga/common/MyFontSize.dart';
import 'package:base_flutter_by_rangga/common/MyString.dart';
import 'package:flutter/material.dart';

class CustomUnderConstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          MyString.underConstruction,
          style: TextStyle(
            fontSize: MyFontSize.large2,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}