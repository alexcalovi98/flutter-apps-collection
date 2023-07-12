import 'package:destini/story.dart';

class StoryBrain {

  final List<Story> _storyData = [
    Story(
        title:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: StoryChoice('I\'ll hop in. Thanks for the help!', 2),
        choice2: StoryChoice('Better ask him if he\'s a murderer first.', 1),
    ),
    Story(
        title: 'He nods slowly, unphased by the question.',
        choice1: StoryChoice('At least he\'s honest. I\'ll climb in.', 2),
        choice2: StoryChoice('Wait, I know how to change a tire.', 3),
    ),
    Story(
        title:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: StoryChoice('I love Elton John! Hand him the cassette tape.', 5),
        choice2: StoryChoice('It\'s him or me! You take the knife and stab him.', 4),
    ),
    Story(
        title:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: StoryChoice('Restart', 0),
        choice2: null
    ),
    Story(
        title:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: StoryChoice('Restart', 0),
        choice2: null
    ),
    Story(
        title:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: StoryChoice('Restart', 0),
        choice2: null
    ),
  ];

  int _storyIndex = 0;

  String getStory() => _storyData[_storyIndex].title;

  String getChoice1() => _storyData[_storyIndex].choice1.text;
  String? getChoice2() => _storyData[_storyIndex].choice2?.text;

  void nextStory(int choice) {
    if(choice == 1){
      _storyIndex = _storyData[_storyIndex].choice1.nextStory;
    } else if(choice == 2) {
      StoryChoice? choice2 = _storyData[_storyIndex].choice2?..nextStory;
      if(choice2 != null) {
        _storyIndex = choice2.nextStory;
      }
    }
  }
}
