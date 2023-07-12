import 'package:destini/story_brain.dart';
import 'package:destini/story_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Destini',
      debugShowCheckedModeBanner: false,
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  final StoryBrain _storyBrain = StoryBrain();

  void updateState(int choice) {
    setState(() {
      _storyBrain.nextStory(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        _storyBrain.getStory(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  StoryButton(
                      text: _storyBrain.getChoice1(),
                      color: Colors.redAccent,
                      onPressed: () {
                        updateState(1);
                      }
                  ),
                  StoryButton(
                      text: _storyBrain.getChoice2(),
                      color: Colors.blueAccent,
                      onPressed: () {
                        updateState(2);
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
