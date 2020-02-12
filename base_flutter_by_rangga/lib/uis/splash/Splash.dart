import 'dart:async';
import 'package:base_flutter_by_rangga/common/MyColor.dart';
import 'package:base_flutter_by_rangga/common/MyConstanta.dart';
import 'package:base_flutter_by_rangga/common/MyHelper.dart';
import 'package:base_flutter_by_rangga/uis/auth/UserLogin.dart';
import 'package:flutter/material.dart';
import '../MainMenu.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    MyHelper.getPref(MyConstanta.token).then((result) {
      if (result != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => MainMenu(),
        ));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => UserLogin(),
        ));
      }
    });
  }

  @override
  void initState() {
    startTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyHelper.hexToColor(MyColor.primary),
      body: Center(
        child: Image.asset(
          "assets/image/toska_maskot.png",
          fit: BoxFit.fitWidth,
          width: 320.0,
        ),
      ),
    );
  }
}