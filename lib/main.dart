import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

List<Color> rainbow = [
  Color(0xFFFF0000),
  Color(0xFFFF7F00),
  Color(0xFFFFFF00),
  Color(0xFF00FF00),
  Color(0xFF0000FF),
  Color(0xFF2E2B5F),
  Color(0xFF8B00FF)
];
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final AudioCache player = AudioCache();

  Widget buildXylo(Color color, int notenumber) {
    return Expanded(
      child: FlatButton(
        child: Text(""),
        color: color,
        onPressed: () {
          player.play('note$notenumber.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < 7; i++) buildXylo(rainbow[i], i + 1),
                ]),
          ),
        ),
      ),
    );
  }
}
