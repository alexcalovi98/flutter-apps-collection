import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
        title: const Text("I Am Poor",
            style: TextStyle(fontFamily: 'PressStart2P', fontSize: 32)),
        backgroundColor: Colors.yellowAccent,
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: const Center(
        child: Image(image: AssetImage('images/pacman.png')),
      ),
    ),
  ));
}
