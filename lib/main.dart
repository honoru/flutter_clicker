import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new  MaterialButton(
                child: Text("Click here"),
                color: Colors.lightBlue,
                onPressed: () {
                  // Do something here
                  _incrementCounter();

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /**
   *함수 증가 및 메시지 출력 함수
   */
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;// 카운트 +1 증가

    Fluttertoast.showToast(//메시지 출력
        msg: 'Pressed $counter times.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 3);

    await prefs.setInt('counter', counter);//카운트 입력
  }
}
