import 'package:flutter/material.dart';
import 'submit.dart';

class QuizMode extends StatefulWidget {
  final List<Map<String, String>> flashcards;
  final int currentIndex;
  final Function(String) checkAnswer;

  const QuizMode({
    super.key,
    required this.flashcards,
    required this.currentIndex,
    required this.checkAnswer,
  });

  @override
  _QuizModeState createState() => _QuizModeState();
}

class _QuizModeState extends State<QuizMode> {
  final _answerController = TextEditingController();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.flashcards.isNotEmpty
                ? widget.flashcards[widget.currentIndex]['question'] ?? ''
                : '',
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _answerController,
            decoration: const InputDecoration(
              labelText: 'Answer',
            ),
          ),
        ),
        Submit(
          checkAnswer: () {
            widget.checkAnswer(_answerController.text);
            _answerController.clear();
          },
        ),
      ],
    );
  }
}