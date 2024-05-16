import 'package:flutter/material.dart';
import 'package:languange_flashcard/pages/flashcards_screen.dart';

class buildIntroduction extends StatefulWidget {
  const buildIntroduction({super.key});

  @override
  State<buildIntroduction> createState() => buildIntroductionState();
}

class buildIntroductionState extends State<buildIntroduction> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Colors.pink,
          title: Text(
            'English to Korean Flashcards',
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          ),
          body: Center(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            Text(
              'Welcome to the English-Korean Flashcards App!',
              style: TextStyle(fontSize: 39, color: Color.fromARGB(255, 255, 0, 212)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Text(
              'Tap the arrow button below to see the next flashcard.',
              style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 0, 191)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Tap on the card to flip it and see the translation.',
              style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 0, 191)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FlashcardsScreen()),
                );
              },
              child: Text('Start Learning', style: TextStyle(fontSize: 15, color: Colors.pinkAccent),),
            )]
            ),
          )
          );
          }
          }