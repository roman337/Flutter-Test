import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyFirstStateful());
}

class MyFirstStateful extends StatefulWidget {
  @override
  State<MyFirstStateful> createState() {
    return _MyState();
  }
}

class _MyState extends State<MyFirstStateful> {
  bool inPressed = false;
  double percent = 0;
  late Timer _timer;

  void startTimer() {
        Duration oneSec = const Duration(seconds: 1);

        _timer = Timer.periodic(oneSec, (timer) { 
          if (percent == 100) {
            _timer.cancel();
            return;
          }
          setState(() =>  percent += 20);
          
        });
      }

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: AppBar(
          title: const Text('DOWNLOADER'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: inPressed ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(
                  value: percent * 0.01,
                  color: Colors.indigo,
                ),
                Text('$percent%', style: const TextStyle(
                  fontSize: 25),), 
            ],)
            : 
            const Text('Click on the button', style: TextStyle(
              fontSize: 30, 
            )),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Download'),
          icon: const Icon(Icons.download),
          backgroundColor: Colors.red,
          focusColor: Colors.amber.shade100,
          onPressed: () {
            startTimer();
            setState( () {
              inPressed = !inPressed;
              percent = 0;
          },);
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
    
      ),
    );

    
  }
} 
