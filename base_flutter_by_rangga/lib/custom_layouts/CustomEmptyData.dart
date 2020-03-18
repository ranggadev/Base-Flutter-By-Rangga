import 'package:base_flutter_by_rangga/common/MyFontSize.dart';
import 'package:base_flutter_by_rangga/common/MyString.dart';
import 'package:flutter/material.dart';

class CustomEmptyData extends StatelessWidget {

  final bool showImgAssets, showButton;
  final double height, width;
  final String imgAssets, caption, buttonCaption;
  final VoidCallback buttonAction;

  const CustomEmptyData({Key key, this.showImgAssets = true, this.showButton = true, this.height, this.width, this.imgAssets, this.caption, this.buttonCaption, this.buttonAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (this.showImgAssets) ? Image.asset(
              this.imgAssets == null ? "assets/gif/gif_empty.gif" : this.imgAssets,
              width: 160.0,
              height: 80.0,
              fit: BoxFit.cover,
            ) : Container(),
            Text(
              this.caption == null ? MyString.noData : this.caption,
              style: TextStyle(fontSize: MyFontSize.small1, color: Colors.grey),
            ),
            SizedBox(height: 8.0,),
            (this.showButton) ? FlatButton(
                onPressed: () {
                  buttonAction();
                },
                color: Colors.grey.withOpacity(.2),
                child: Text(this.buttonCaption == null ? MyString.refresh : this.buttonCaption)
            ) : Container(),
          ],
        ),
      ),
    );
  }
}