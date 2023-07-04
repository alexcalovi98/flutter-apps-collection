import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              XylophoneButton(
                track: "note1.wav",
                color: Colors.red,
              ),
              XylophoneButton(
                track: "note2.wav",
                color: Colors.orange,
              ),
              XylophoneButton(
                track: "note3.wav",
                color: Colors.yellow,
              ),
              XylophoneButton(
                track: "note4.wav",
                color: Colors.green,
              ),
              XylophoneButton(
                track: "note5.wav",
                color: Colors.teal,
              ),
              XylophoneButton(
                track: "note6.wav",
                color: Colors.blue,
              ),
              XylophoneButton(
                track: "note7.wav",
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class XylophoneButton extends StatelessWidget {
  XylophoneButton({super.key, required this.track, required this.color});

  final player = AudioPlayer();

  final String track;
  final MaterialColor color;

  void playSound(String fileName) {
    player.play(AssetSource(fileName));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(track);
        },
        child: Container(color: color),
      ),
    );
  }
}
