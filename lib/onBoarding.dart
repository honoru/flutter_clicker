import 'package:clicker/ClickPage.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:fancy_on_boarding/page_model.dart';
import 'package:flutter/material.dart';

class onBoarding extends StatefulWidget {
  onBoarding({Key key, this.title}) : super(key: key);

  final String title; //애가 어디쓰이는 지 모르겠따..

  @override
  _onBoardingState createState() => new _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  //Create a list of PageModel to be set on the onBoarding Screens.
  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/img/img_click1.png',
        title: Text('준비',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('클리커와 사료(또는 간식)와\n댕댕이를 준비해놓습니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
        iconAssetPath: 'assets/img/img_click1.png'),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroAssetPath: 'assets/img/img_click2.png',
        title: Text('간식주기',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('사료(또는 간식)를 주고',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
        iconAssetPath: 'assets/img/img_click2.png'),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroAssetPath: 'assets/img/img_click3.png',
      title: Text('클릭',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('버튼을 클릭합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          )),
      iconAssetPath: 'assets/img/img_click3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        pageList: pageList,
        mainPageRoute: '/ClickPage',
      ),
    );
  }
}
