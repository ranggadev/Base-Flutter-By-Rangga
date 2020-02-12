import 'package:base_flutter_by_rangga/apis/AuthAPI.dart';
import 'package:base_flutter_by_rangga/common/MyColor.dart';
import 'package:base_flutter_by_rangga/common/MyFontSize.dart';
import 'package:base_flutter_by_rangga/common/MyHelper.dart';
import 'package:base_flutter_by_rangga/common/MyString.dart';
import 'package:base_flutter_by_rangga/master_layouts/MyLoading.dart';
import 'package:flutter/material.dart';

import '../MainMenu.dart';
import 'UserRegister.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _obscureText = true;
  bool _loadingLogin = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double heightContainer = 360;

    final widgetEmail = Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        color: Colors.white,
      ),
      child: TextField(
        controller: _emailController,
        focusNode: _usernameFocus,
        onSubmitted: (term) {
          FocusScope.of(context).requestFocus(_passwordFocus);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: MyString.lorem1,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MyFontSize.medium1,
          ),
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );

    final widgetPassword = Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          TextField(
            controller: _passwordController,
            focusNode: _passwordFocus,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: MyString.lorem1,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: MyFontSize.medium1,
              ),
              icon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
          Positioned(
            top: 9.0,
            right: 0.0,
            child: InkWell(
              child: Icon(
                Icons.remove_red_eye,
                color: _obscureText ? Colors.grey : Colors.orange,
              ),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ],
      ),
    );

    final widgetForgotPass = FlatButton(
      onPressed: () {

      },
      child: Text(
        MyString.lorem1,
        style: TextStyle(
          fontSize: MyFontSize.small1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final header = Container(
      height: heightContainer,
      color: MyHelper.hexToColor(MyColor.primary),
      padding: EdgeInsets.only(bottom: 40.0),
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.fitWidth,
          width: 120.0,
        ),
      ),
    );

    final loginInputWrapper = Card(
      margin: EdgeInsets.fromLTRB(24.0, heightContainer - 100.0, 24.0, 24.0),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            widgetEmail,
            SizedBox(height: 16.0,),
            widgetPassword,
            widgetForgotPass,
          ],
        ),
      ),
    );

    final widgetLogin = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 56.0),
      height: 56.0,
      decoration: BoxDecoration(
        color: MyHelper.hexToColor(MyColor.primary),
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: FlatButton(
        onPressed: (){
          if (!_loadingLogin) {
            login();
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: _loadingLogin ? MyLoading(color: Colors.white,) : Text(
          MyString.lorem1,
          style: TextStyle(
            fontSize: MyFontSize.large1,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final widgetDontHaveAccount = Container(
      margin: EdgeInsets.only(top: 8.0, left: 56.0, right: 56.0, bottom: 16.0),
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => UserRegister()));
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              color: MyHelper.hexToColor(MyColor.blackText),
              fontSize: MyFontSize.medium1,
            ),
            children: <TextSpan>[
              TextSpan(text: MyString.lorem1),
              TextSpan(text: ' '),
              TextSpan(
                text: MyString.lorem1.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      )
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  header,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      loginInputWrapper,
                      widgetLogin,
                      widgetDontHaveAccount,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void login() {
    if (
      _emailController.text.isEmpty ||
      _passwordController.text.isEmpty
    ) {
      MyHelper.toast(MyString.dataCouldNotBeEmpty);
    } else {
      setState(() {
        _loadingLogin = true;
      });

      var params = new Map<String, String>();
      params["email"]      = _emailController.text;
      params["password"]   = _passwordController.text;

      UserAPI.userLogin(params).then((response) async {
        setState(() {
          _loadingLogin = false;

          if (response.status == "success") {
            MyHelper.setPrefBearerToken(response.data.token);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => MainMenu()));
          }

          MyHelper.toast(response.message.toString());
        });
      }, onError: (error) {
        setState(() {
          _loadingLogin = false;
          MyHelper.toast(MyString.somethingWrong);
        });
      });      
    }
  }
}