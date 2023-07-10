import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:quizzler/quiz_button.dart';
import 'package:quizzler/quiz_finished_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  void answerAndNext(bool answer) {
    if(quizBrain.ended()) {
      showQuizFinished();
    } else {
      setState(() {
        if(quizBrain.correctAnswer(answer)) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }
        quizBrain.next();
      });
    }
  }

  void showQuizFinished() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => QuizFinishedDialog(
        onReset: () {
          Navigator.pop(context);
          setState(() {
            quizBrain.reset();
            scoreKeeper.clear();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        QuizButton(
          color: Colors.green.shade400,
          onPressed: () {
            answerAndNext(true);
          },
          text: "True",
        ),
        QuizButton(
          color: Colors.red.shade400,
          onPressed: () {
            answerAndNext(false);
          },
          text: "False",
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}