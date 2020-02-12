import 'package:flutter/material.dart';

class MySomethingWrong extends StatelessWidget {

  final double height, width;
  final String buttomTitle;
  final VoidCallback buttomAction;

  const MySomethingWrong({Key key, this.height = double.infinity, this.width = double.infinity, this.buttomTitle = "Refresh", this.buttomAction}) : super(key: key);

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
              "assets/gif_common/sometring_wrong.gif",
              width: 220.0,
              height: 170.0,
              fit: BoxFit.cover,
            ),
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
