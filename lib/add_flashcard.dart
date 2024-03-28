import 'package:flutter/material.dart';

class AddFlashcardMode extends StatefulWidget {
  final Function(String, String) addFlashcard;
  final VoidCallback startQuiz;
  final List<Map<String, String>> flashcards;

  const AddFlashcardMode({
    super.key,
    required this.addFlashcard,
    required this.startQuiz,
    required this.flashcards,
  });

  @override
  _AddFlashcardModeState createState() => _AddFlashcardModeState();
}

class _AddFlashcardModeState extends State<AddFlashcardMode> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _questionController,
            decoration: const InputDecoration(
              labelText: 'Question',
            ),
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
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            onPressed: () {
              widget.addFlashcard(
                _questionController.text,
                _answerController.text,
              );
              _questionController.clear();
              _answerController.clear();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Text('Add Flashcard', style: TextStyle(fontSize: 16.0)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: ElevatedButton(
            onPressed: widget.flashcards.isNotEmpty ? widget.startQuiz : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Text('Start Quiz', style: TextStyle(fontSize: 16.0)),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.flashcards.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(widget.flashcards[index]['question'] ?? ''),
                  subtitle: Text(widget.flashcards[index]['answer'] ?? ''),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}