import 'package:flutter/material.dart';
import 'add_flashcard.dart';
import 'start_quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> flashcards = [];
  int currentIndex = 0;
  int score = 0;
  bool isQuizMode = false;

  void _addFlashcard(String question, String answer) {
    setState(() {
      flashcards.add({'question': question, 'answer': answer});
    });
  }

  void _startQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
      isQuizMode = true;
    });
  }

  void _checkAnswer(String userAnswer) {
    if (userAnswer.toLowerCase() ==
        flashcards[currentIndex]['answer']!.toLowerCase()) {
      setState(() {
        score++;
        currentIndex++;
      });
    } else {
      setState(() {
        currentIndex++;
      });
    }

    if (currentIndex >= flashcards.length) {
      _endQuiz();
    }
  }

  void _endQuiz() {
    setState(() {
      isQuizMode = false;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('Your score is $score/${flashcards.length}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Quiz App'),
      ),
      body: isQuizMode
          ? QuizMode(
              flashcards: flashcards,
              currentIndex: currentIndex,
              checkAnswer: _checkAnswer,
            )
          : AddFlashcardMode(
              addFlashcard: _addFlashcard,
              startQuiz: _startQuiz,
              flashcards: flashcards,
            ),
    );
  }
}