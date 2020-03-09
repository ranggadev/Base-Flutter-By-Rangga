import 'package:base_flutter_by_rangga/common/MyFontSize.dart';
import 'package:base_flutter_by_rangga/common/MyString.dart';
import 'package:flutter/material.dart';

class CustomEmptyData extends StatelessWidget {

  final double height, width;
  final String buttomTitle;
  final VoidCallback buttomAction;

  const CustomEmptyData({Key key, this.height = double.infinity, this.width = double.infinity, this.buttomTitle = "Refresh", this.buttomAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/gif_common/empty.gif",
              width: 160.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            Text(
              MyString.noData,
              style: TextStyle(fontSize: MyFontSize.small1, color: Colors.grey),
            ),
            SizedBox(height: 8.0,),
            FlatButton(
              onPressed: () {
                buttomAction();
              },
              color: Colors.grey.withOpacity(.2),
              child: Text(buttomTitle)
            ),
          ],
        ),
      ),
    );
  }
}
