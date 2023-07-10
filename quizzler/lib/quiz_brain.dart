import 'question_list.dart';

class QuizBrain {

  final QuestionList _questions = QuestionList();

  int _questionIndex = 0;

  void next() {
    if(!ended()) {
      _questionIndex++;
    }
  }

  bool ended() => _questionIndex >= _questions.length - 1;

  String getQuestionText() => _questions[_questionIndex].text;

  bool correctAnswer(bool answer) =>
      _questions[_questionIndex].answer == answer;

  void reset() => _questionIndex = 0;
}