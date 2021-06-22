import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flashlight/flashlight.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasFlashlight = false;
  final player = AudioCache();

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Lumos Flashlight',
               style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
          backgroundColor: Colors.black12,
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(top: 80, bottom: 25),
              child: Image.asset('assets/images/lumos11.png'),
            ),
            Text(
              _hasFlashlight
                  ? 'Your phone has a Flashlight.'
                  : 'Your phone has no Flashlight.',
               style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.yellow)),
                color: Colors.yellow,
                child: Text(
                  'Lumos Maxima',
                 style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  player.play('lumos.mp3');
                  Flashlight.lightOn();
                 
                }),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.yellow)),
                color: Colors.yellow,
                child: Text(
                  'Turn off',
                 style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Flashlight.lightOff();
             
                }),
            Flexible(
              child: Align(
                alignment: Alignment(0, 1),
                child: _currentAd,
              ),
              fit: FlexFit.tight,
              flex: 2,
            ),
          ],
        )),
      ),
    );
  }
}
