import 'package:flutter/material.dart';
import 'package:hediyepaketi/webView.dart';

import 'custom_splash_screen.dart';
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,

    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new CustomSplashScreen(
        errorSplash: errorSplash(),
        backgroundColor: Colors.white,
        loadingSplash: loadingSplash(),
        seconds: 2,
        navigateAfterSeconds: new WebView(),
      ),
    );
  }

  Widget errorSplash() {
    return Center(
      child: Text(
        "Please Try Again Later",
        style: TextStyle(fontSize: 25.0, color: Colors.red),
      ),
    );
  }

  Widget loadingSplash() {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                flex: 2,
                child: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: new Container(
                            child:Image(image: AssetImage('images/tb.png'),)
                          ),
                          radius: 100.0,
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    Text("Loading",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    new Center(
                      child: Text("Now",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

