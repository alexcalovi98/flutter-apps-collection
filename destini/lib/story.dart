class Story {

  Story({
    required this.title,
    required this.choice1,
    required this.choice2
  });

  String title;
  StoryChoice choice1;
  StoryChoice? choice2;
}

class StoryChoice {

  StoryChoice(this.text, this.nextStory);

  String text;
  int nextStory;
}