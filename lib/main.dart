import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller = StreamController<double>();
  StreamSubscription<double> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MaterialButton(
                  child: Text('Subscribe'),
                  color: Colors.yellow,
                  onPressed: () async {
                    this.streamSubscription = controller.stream.listen((value) {
                      print('Valor recebido da subscription: ${value}');
                    });
                  },
                ),
                MaterialButton(
                  child: Text('Emit Value'),
                  color: Colors.blue[200],
                  onPressed: () {
                    controller.add(1.0);
                  },
                ),
                MaterialButton(
                  child: Text('Unsubscribe'),
                  color: Colors.red[200],
                  onPressed: () {
                    this.streamSubscription.cancel();
                    print("Stream cancelada");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}