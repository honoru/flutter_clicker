import 'package:clicker/ClickPage.dart';
import 'package:clicker/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _isFirst = true;

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirst = prefs.getBool('isFirst') ?? true;
  _isFirst = isFirst; //최초실행 확인

  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var activity;
    if (_isFirst) {
      activity = onBoarding(title: '클리커 튜토리얼');
      setFirst();
    } else {
      //최초실행
      activity = ClickApp();
    }

    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: '클리커',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Nunito'),
      routes: {'/ClickPage': (context) => ClickApp()},
      home: activity,
    );
  }

  /**
   * 최초실행 체크
   */
  setFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirst', false);
  }
}
