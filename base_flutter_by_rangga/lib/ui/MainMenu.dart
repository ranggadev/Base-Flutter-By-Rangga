import 'package:base_flutter_by_rangga/common/MyColor.dart';
import 'package:base_flutter_by_rangga/common/MyFontSize.dart';
import 'package:base_flutter_by_rangga/common/MyHelper.dart';
import 'package:base_flutter_by_rangga/common/MyString.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> mainMenuKey = GlobalKey<ScaffoldState>();

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {

    Drawer drawer() {
      return Drawer(        
        child: ListView(
          children: <Widget>[
            Container(
              height: 60.0,
              color: MyHelper.hexToColor(MyColor.primary),
              child: Center(
                child: Text(
                  MyString.lorem1,
                  style: TextStyle(
                    fontSize: MyFontSize.medium2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text(
                MyString.lorem1,
                style: TextStyle(
                  fontSize: MyFontSize.medium2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text(
                MyString.lorem1,
                style: TextStyle(
                  fontSize: MyFontSize.medium2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      key: mainMenuKey,
      body: PageStorage(
        bucket: bucket,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.open_with),
            icon: Icon(Icons.close),
            title: Text(
              MyString.lorem1,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.open_with),
            icon: Icon(Icons.close),
            title: Text(
              MyString.lorem1,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.open_with),
            icon: Icon(Icons.close),
            title: Text(
              MyString.lorem1,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      endDrawer: drawer(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}