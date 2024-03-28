import 'package:flutter/material.dart';

class Submit extends StatelessWidget {
  final VoidCallback checkAnswer;

  const Submit({super.key, required this.checkAnswer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: checkAnswer,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Text('Submit', style: TextStyle(fontSize: 16.0)),
        ),
      ),
    );
  }
}