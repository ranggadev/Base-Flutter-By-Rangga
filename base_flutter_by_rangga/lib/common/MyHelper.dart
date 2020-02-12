import 'dart:math';
import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MyColor.dart';
import 'MyConstanta.dart';


const _kSmilies = {':)': '🙂'};

final smilieOp = BuildOp(
  onPieces: (meta, pieces) {
    final alt = meta.domElement.attributes['alt'];
    final text = _kSmilies.containsKey(alt) ? _kSmilies[alt] : alt;
    return pieces..first?.block?.addText(text);
  },
);

class MyHelper {

  //--- Common Helpers ---

  static String mapToParamsGet(var params) {
    String tempUrl = "?";
    for (var i = 0; i < params.length; i++) {
      if (i == 0) {
        tempUrl = tempUrl + params.keys.elementAt(i).toString() + "=" + params.values.elementAt(i).toString();
      } else {
        tempUrl = tempUrl + "&" + params.keys.elementAt(i).toString() + "=" + params.values.elementAt(i).toString();
      }
    }

    return tempUrl;
  }

  static String formatNumber(int number) {
    var f = new NumberFormat("#,###");

    return f.format(number).replaceAll(",", ".");
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String formatRupiah(int price) {
    if (price == 0) {
      return "Tidak ada data";
    }

    final oCcy = new NumberFormat("#,##0", "en_US");

    final f = oCcy.format(price);

    return "Rp. " + f.toString();
  }

  static int returnToInt(var input) {
    int result = 0;

    if (input is int) {
      result = input;
    } else if (input is double) {
      result = (.5 * input).round();
    } else if (input is String) {
      result = 0;
    } else if (input == null) {
      result = 0;
    } else {
      result = 0;
    }

    return result;
  }

  static double returnToDouble(var input) {
    double result = 0;

    if (input is int) {
      result = input.toDouble();
    } else if (input is double) {
      result = input;
    } else if (input is String) {
      result = 0;
    } else if (input == null) {
      result = 0;
    } else {
      result = 0;
    }

    return result;
  }

  static String returnToString(var input) {
    String result = "";

    if (input is int) {
      result = input.toString();
    } else if (input is double) {
      result = input.toString();
    } else if (input is String) {
      result = input.toString();
    } else if (input == null) {
      result = "-";
    } else {
      result = "-";
    }

    return result;
  }

  static String formatDate(String date) {
    if (date == null || date == "" || date == "null") return "-";

    final f = DateFormat("dd MMM yyyy (hh:mm:ss)").format(DateTime.parse(date));
    return f.toString();
  }

  static String formatShortDate(String date) {
    if (date == null || date == "" || date == "null") return "-";

    final f = DateFormat("dd MMM yyyy").format(DateTime.parse(date));
    return f.toString();
  }

  static String formatDateTimeToTime(String date) {
    if (date == null || date == "" || date == "null") return "-";

    final f = DateFormat("hh:mm:ss").format(DateTime.parse(date));
    return f.toString();
  }

  static String formatDateTimeToShortTime(String date) {
    if (date == null || date == "" || date == "null") return "-";

    final f = DateFormat("hh:mm").format(DateTime.parse(date));
    return f.toString();
  }

  static String subString(String text, int startIndex, int endIndex) {
    return (text.length < endIndex) ? text : text.substring(startIndex, endIndex) + " ...";
  }

  static toast(String message) {
    BotToast.showText(
      text: message,
      duration: Duration(seconds: 3),
    );  //popup a text toast;
 }

  static dialog(BuildContext context, String title, String message, String y, String n, void yes(), void no()) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text(n),
              onPressed: () {
                no();
              },
            ),
            FlatButton(
              color: MyHelper.hexToColor(MyColor.primary),
              child: new Text(y, style: TextStyle(color: Colors.white),),
              onPressed: () {
                yes();
              },
            ),
          ],
        );
      },
    );
  }

  static String slugWeb(String text) {

    String slug = "";

    slug = text.replaceAll("/", "*");
    slug = slug.replaceAll("-", "~");
    slug = slug.replaceAll(" ", "-");

    return slug;
  }

  static launchURL(String urlx) async {
    String url = urlx; //--- set value
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }

  static Color colorRandom() {
    Random random = new Random();
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  static setPref(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);

    print("rangga : set pref $value");
  }

  // --- How to use Future get pref : ---
  // MyHelper.getPref(MyConstanta.token).then((result){
  //  print("pref : " + result);
  //  write code here...
  // });
  static Future<String> getPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("rangga : get pref");
    return prefs.getString(key);
  }

  static deleteAllPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    print("rangga : delete all pref");
  }

  static removeAnPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);

    print("rangga : remove an pref");
  }





  //--- Others Helper ---

  static void setPrefBearerToken(String token) {
    MyHelper.setPref(MyConstanta.token, "Bearer " + token); //set bearer to pref
  }

//  static void removeAllTagsFasesInOnesignal(void unShowLoading(), void snackBar1(), void action1()) {
//    print("rangga remove all tags Faskes in Onesignal");
//    snackBar1();
//
//    //get all tags from Onesignal
//    List<String> listFaskesSubscribedId = [];
//    Future<Map<String, dynamic>> listFaskesSubscribed = OneSignal.shared.getTags();
//    listFaskesSubscribed.then((onValue){
//      //delete all tags in Onesignal
//      listFaskesSubscribedId.addAll(onValue.keys);
//      OneSignal.shared.deleteTags(listFaskesSubscribedId).then((response) {
//        action1();
//      }).catchError((error) {
//        unShowLoading();
//        print("rangga : " + error.toString());
//        MyHelper.toast(MyString.somethingWrong);
//      });
//    }, onError: (error) {
//      unShowLoading();
//      print("rangga : " + error.toString());
//      MyHelper.toast(MyString.somethingWrong);
//    });
//  }
//
//  static void sendAllTagsFaskesInOnesignal(void unShowLoading(), void snackBar1(), void action1()) {
//    print("rangga all tags Faskes in Onesignal");
//    snackBar1();
//
//    final params = Map<String, String>();
//    params["page"] = 1.toString();
//
//    MyHelper.getPref(MyConstanta.token).then((bearerToken) {
//      if (bearerToken != null) {
//        FaskesAPI.faskesListSubscribed(bearerToken).then((response) {
//          if (response.status == "success") {
//            final faskesTags = Map<String, dynamic>();
//            response.data.forEach((f){
//              faskesTags["faskes_" + f.faskesId.toString()] = "subscribed";
//            });
//
//            OneSignal.shared.sendTags(faskesTags).then((response) {
//              unShowLoading();
//              action1();
//            }).catchError((error) {
//              unShowLoading();
//              print("rangga : " + error.toString());
//              MyHelper.toast(MyString.somethingWrong);
//            });
//          } else {
//            unShowLoading();
//            MyHelper.toast(MyString.somethingWrong);
//          }
//        }, onError: (error) {
//          unShowLoading();
//          print("rangga : " + error.toString());
//          MyHelper.toast(MyString.somethingWrong);
//        });
//      }
//    });
//  }
}