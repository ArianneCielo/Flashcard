import 'package:flutter/material.dart';

class Flashcard extends StatelessWidget {
  final bool showEnglish;
  final String englishText;
  final String koreanText;

  Flashcard({required this.showEnglish, required this.englishText, required this.koreanText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Color.fromRGBO(241, 108, 175, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        showEnglish ? englishText : koreanText,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
