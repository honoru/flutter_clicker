import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:volume/volume.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioCache player = new AudioCache(); //오디오 플레이어 객채 만들고..
  AudioManager audioManager;
  int maxVol, currentVol; //음량

  @override
  void initState() {
    super.initState();
    audioManager = AudioManager.STREAM_MUSIC; //미디어 음량으로
    initPlatformState();
    updateVolumes();
  }

  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  updateVolumes() async {
    // get Max Volume
    maxVol = await Volume.getMaxVol;
    // get Current Volume
    currentVol = await Volume.getVol;
    setState(() {});
  }

  setVol(int i) async {
    await Volume.setVol(i);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clicker-Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'Sound Control',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              (currentVol != null || maxVol != null)
                  ? Slider(
                      value: currentVol / 1.0,
                      divisions: maxVol,
                      max: maxVol / 1.0,
                      min: 0,
                      onChanged: (double d) {
                        setVol(d.toInt());
                        updateVolumes();
                      },
                    )
                  : Container(),
              Container(
                margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
                child: MaterialButton(
                    minWidth: 160.0,
                    height: 160.0,
                    color: Colors.lightBlue,
                    child: Text(
                      "Click!",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // Do something here
                      _incrementCounter();
                    }),
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
    int counter = (prefs.getInt('counter') ?? 0) + 1; // 카운트 +1 증가

    Fluttertoast.showToast(
        //메시지 출력
        msg: 'Pressed $counter times.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 3);

    const alarmAudioPath = "click1.mp3";
    player.play(alarmAudioPath); //오디오 재생

    await prefs.setInt('counter', counter); //카운트 입력
  }
}
