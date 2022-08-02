
import 'package:flutter/material.dart';
import 'package:quiz_app/api/url_data.dart';
import 'package:quiz_app/style/theme.dart';
import 'package:quiz_app/view/quiz_screen.dart';

Padding difficultyTile(String difficulty, String title, BuildContext context ) {
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          urlDataDifficulty(difficulty);
          Navigator.push(context,
              MaterialPageRoute(
                  builder:  (context) => QuizScreen(),
              ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(title,
            style: const TextStyle(
              fontSize: 20,
            ),
            ),
          ),
        ),
      ),
  );
}