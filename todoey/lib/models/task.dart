class Task {

  final String text;
  bool done = false;

  Task(this.text);

  void toggle() => done = !done;
}