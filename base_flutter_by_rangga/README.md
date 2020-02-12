# Base Flutter By Rangga Saputra

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Setting in Android Native Code (Required)
1. Make project must use Android Studio
2. ![Image 1](https://gitlab.com/ranggalb/base-flutter-by-rangga/-/blob/master/assets%20+%20config/Gitlab%20Image/Screenshot_1.jpg)
3. ![Image 2](https://gitlab.com/ranggalb/base-flutter-by-rangga/-/blob/master/assets%20+%20config/Gitlab%20Image/Screenshot_2.jpg)
4. If you are using Kotlin as base language of Android, so change android/build.gradle like image bellow.
![Image 3](https://gitlab.com/ranggalb/base-flutter-by-rangga/-/blob/master/assets%20+%20config/Gitlab%20Image/Screenshot_3.jpg)
info : I ever not change that code, so my project has an Error
5. Add this code in android/app/src/main/AndroidManifest.xml
- Add user permission INTERNET (Required)
- On Android Oreo or above, you must add android:usesCleartextTraffic="true" in order to access the internet (Required)
![Image 4](https://gitlab.com/ranggalb/base-flutter-by-rangga/-/blob/master/assets%20+%20config/Gitlab%20Image/Screenshot_4.jpg)


## Setting in Flutter Project
1. Get many depedencies in pubspec.yaml. I divide into two section. I call it #Common Depedencies and #Others Depedencies
![Image 5](https://gitlab.com/ranggalb/base-flutter-by-rangga/-/blob/master/assets%20+%20config/Gitlab%20Image/Screenshot_5.jpg)
2. Add folder and file assets and don't forget to write this code in pubspec.yaml
![Image 6](https://gitlab.com/ranggalb/base-flutter-by-rangga/-/blob/master/assets%20+%20config/Gitlab%20Image/Screenshot_6.jpg)
3. Make lib folder like this architecture
![Image 7](https://gitlab.com/ranggalb/base-flutter-by-rangga/-/blob/master/assets%20+%20config/Gitlab%20Image/Screenshot_7.jpg)