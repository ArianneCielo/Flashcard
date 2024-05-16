import 'package:flutter/material.dart';
import 'package:languange_flashcard/components/flashcards_app.dart';


class FlashcardsScreen extends StatefulWidget {
  @override
  FlashcardsScreenState createState() => FlashcardsScreenState();
}

class FlashcardsScreenState extends State<FlashcardsScreen> {
  List<Map<String, String>> cards = [
    {"English": "A", "Korean": "ㅏ"},
    {"English": "B", "Korean": "ㅂ"},
    {"English": "C", "Korean": "ㅋ"},
    {"English": "D", "Korean": "ㄷ"},
    {"English": "E", "Korean": "ㅔ"},
    {"English": "G", "Korean": "ㄱ"},
    {"English": "H", "Korean": "ㅎ"},
    {"English": "I", "Korean": "ㅣ"},
    {"English": "J", "Korean": "ㅈ"},
    {"English": "K", "Korean": "ㅋ"},
    {"English": "L", "Korean": "ㄹ"},
    {"English": "M", "Korean": "ㅁ"},
    {"English": "N", "Korean": "ㄴ"},
    {"English": "O", "Korean": "ㅗ"},
    {"English": "P", "Korean": "ㅍ"},
    {"English": "R", "Korean": "ㄹ"},
    {"English": "S", "Korean": "ㅅ"},
    {"English": "T", "Korean": "ㅌ"},
    {"English": "U", "Korean": "ㅜ"},
    {"English": "V", "Korean": "ㅂ"},
    {"English": "Hello", "Korean": "Annyeonghaseyo/안녕하세요"},
    {"English": "Goodbye", "Korean": "Annyeonghi Gaseyo/안녕히 가세요"},
    {"English": "Good Morning", "Korean": "Joeun Achimieyo/좋은 아침이에요"},
    {"English": "How Are You?", "Korean": "Yojeum Eottae?/요즘어태?"},
    {"English": "Welcome", "Korean": "Hwangyonghamnida/황용함니다"},
    {"English": "Thank you", "Korean": "Kamsahabnida/감사합니다"},
    {"English": "Sorry", "Korean": "Joesonghabnida/죄송합니다"},
    {"English": "Please", "Korean": "Jebal/제발"},
    {"English": "I love you", "Korean": "Saranghaeyo/사랑해요"},
    {"English": "Nice to meet you", "Korean": "Mannaseo Bangawoyo/만나서 반가워요"},
    {"English": "What’s up?", "Korean": "Museun ir-iya?/무슨 일이야"},
    {"English": "Long Time No See", "Korean": "Oraenmanieyo/오랜만이에요"},
    {"English": "Please stay well	", "Korean": "Jal jinaejuseyo/잘 지내주세요"},
    {"English": "Excuse me", "Korean": "Sillyehabnida/실례합니다"},
    {"English": "Yes", "Korean": "Ye/예"},
    {"English": "No", "Korean": "Aniyo/아니요"},
    {"English": "We", "Korean": "Uri/우리"},
    {"English": "Today", "Korean": "Oneul/오늘"},
    {"English": "Yesterday", "Korean": "Eoje/어제"},
    {"English": "Tomorrow", "Korean": "Naeil/내일"},
    {"English": "Evening", "Korean": "Jeonyeog/저녁"},
     {"English": "Morning", "Korean": "Achim/아침"},
    {"English": "Why?", "Korean": "Wae/왜?"},
    {"English": "When?", "Korean": "Eonje/언제?"},
    {"English": "What?", "Korean": "Mueos/무엇?"},
    {"English": "How?", "Korean": "Eotteohge/어떻게"},
  ];

  int currentIndex = 0;
  bool showEnglish = true;

  void flipCard() {
    setState(() {
      showEnglish = !showEnglish;
    });
  }

  void nextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % cards.length;
      showEnglish = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        title: Text(
          'English to Korean Flashcards',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: flipCard,
                child: Flashcard(
                  showEnglish: showEnglish,
                  englishText: cards[currentIndex]["English"]??"",
                  koreanText: cards[currentIndex]["Korean"]??"",
                ),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nextCard,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

