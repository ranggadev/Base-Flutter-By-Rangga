import 'package:base_flutter_by_rangga/ui/splash/Splash.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'common/MyColor.dart';
import 'common/MyHelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        title: 'Base Flutter By Rangga',
        theme: ThemeData(
          primaryColor: MyHelper.hexToColor(MyColor.primary),
          accentColor: MyHelper.hexToColor(MyColor.primary2),
          primaryIconTheme: IconThemeData(
              color: Colors.white
          ),
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  color: Colors.white
              )
          ),
          fontFamily: 'AvenirNextLTPro',
        ),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: Splash(),
      ),
    );
  }
}