import 'package:base_flutter_by_rangga/apis/AuthAPI.dart';
import 'package:base_flutter_by_rangga/common/MyColor.dart';
import 'package:base_flutter_by_rangga/common/MyFontSize.dart';
import 'package:base_flutter_by_rangga/common/MyHelper.dart';
import 'package:base_flutter_by_rangga/common/MyString.dart';
import 'package:base_flutter_by_rangga/master_layouts/MyLoading.dart';
import 'package:base_flutter_by_rangga/uis/auth/UserLogin.dart';
import 'package:flutter/material.dart';

import '../MainMenu.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _usernameController  = TextEditingController();
  final _emailController     = TextEditingController();
  final _passwordController  = TextEditingController();
  final _cpasswordController = TextEditingController();

  final FocusNode _usernameFocus  = FocusNode();
  final FocusNode _emailFocus     = FocusNode();
  final FocusNode _passwordFocus  = FocusNode();
  final FocusNode _cpasswordFocus = FocusNode();

  bool _obscureText = true;
  bool _loadingLogin = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double heightContainer = 360;

    final widgetName = Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      margin: EdgeInsets.only(bottom: 16.0),
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
        controller: _usernameController,
        focusNode: _usernameFocus,
        onSubmitted: (term) {
          FocusScope.of(context).requestFocus(_emailFocus);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: MyString.lorem1,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MyFontSize.medium1,
          ),
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );

    final widgetEmail = Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      margin: EdgeInsets.only(bottom: 16.0),
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
        focusNode: _emailFocus,
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
      margin: EdgeInsets.only(bottom: 16.0),
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
            onSubmitted: (term) {
              FocusScope.of(context).requestFocus(_cpasswordFocus);
            },
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

    final widgetCPassword = Container(
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
            controller: _cpasswordController,
            focusNode: _cpasswordFocus,
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

    final header = Container(
      height: heightContainer,
      color: MyHelper.hexToColor(MyColor.primary),
      padding: EdgeInsets.only(bottom: 80.0),
      child: Center(
        child: Text(
          MyString.lorem1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    final widgetCancel = Expanded(
      child: Container(
        height: 56.0,
        decoration: BoxDecoration(
          color: MyHelper.hexToColor(MyColor.hint),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: FlatButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => UserLogin()));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            MyString.lorem1,
            style: TextStyle(
              fontSize: MyFontSize.large1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    final widgetRegister = Expanded(
      child: Container(
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
              register();
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
      ),
    );

    final widgetHaveAccount = Container(
      margin: EdgeInsets.only(top: 24.0),
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => UserLogin()));
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
      ),
    );

    final loginInputWrapper = Card(
      margin: EdgeInsets.fromLTRB(24.0, heightContainer - 160.0, 24.0, 24.0),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            widgetName,
            widgetEmail,
            widgetPassword,
            widgetCPassword,
            Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Row(
                children: <Widget>[
                  widgetCancel,
                  SizedBox(width: 16.0,),
                  widgetRegister,
                ],
              ),
            ),
            widgetHaveAccount,
          ],
        ),
      ),
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
                  loginInputWrapper,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void register() {
    if (
      _usernameController.text.isEmpty ||
      _emailController.text.isEmpty ||
      _passwordController.text.isEmpty ||
      _cpasswordController.text.isEmpty
    ) {
      MyHelper.toast(MyString.lorem1);
    } else {
      setState(() {
        _loadingLogin = true;
      });

      var params = new Map<String, String>();
      params["name"]       = _usernameController.text;
      params["email"]      = _emailController.text;
      params["password"]   = _passwordController.text;
      params["c_password"] = _cpasswordController.text;

      UserAPI.userRegister(params).then((response) async {
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
          MyHelper.toast(MyString.lorem1);
        });
      });      
    }
  }
}