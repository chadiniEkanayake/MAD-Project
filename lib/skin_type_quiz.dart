import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';

class SkinTypeQuizPage extends StatefulWidget {
  const SkinTypeQuizPage({super.key});

  @override
  _SkinTypeQuizPageState createState() => _SkinTypeQuizPageState();
}

class _SkinTypeQuizPageState extends State<SkinTypeQuizPage> {
  final Color backgroundColor = Color(0xFF103c37);
  int scoreDry = 0,
      scoreOily = 0,
      scoreCombo = 0,
      scoreSensitive = 0,
      scoreNormal = 0;
  int questionIndex = 0;
  String? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'How does your skin feel after washing?',
      'answers': [
        {'text': 'Tight and dry', 'type': 'dry'},
        {'text': 'Oily and greasy', 'type': 'oily'},
        {'text': 'Smooth and balanced', 'type': 'normal'},
        {'text': 'Dry in some areas, oily in others', 'type': 'combo'},
        {'text': 'Red and irritated', 'type': 'sensitive'},
      ],
    },
    {
      'question': 'How often do you experience breakouts?',
      'answers': [
        {'text': 'Rarely', 'type': 'normal'},
        {'text': 'Frequently', 'type': 'oily'},
        {'text': 'Only in certain areas', 'type': 'combo'},
        {'text': 'When using new products', 'type': 'sensitive'},
        {'text': 'Almost never', 'type': 'dry'},
      ],
    },
    {
      'question': 'How does your skin react to the sun?',
      'answers': [
        {'text': 'Burns easily', 'type': 'sensitive'},
        {'text': 'Tans easily', 'type': 'oily'},
        {'text': 'Neither burns nor tans easily', 'type': 'normal'},
        {'text': 'Burns on some areas, tans on others', 'type': 'combo'},
        {'text': 'Feels extra dry after sun exposure', 'type': 'dry'},
      ],
    },
    {
      'question': 'Do you have visible pores on your skin?',
      'answers': [
        {'text': 'Very small and barely visible', 'type': 'dry'},
        {'text': 'Large and noticeable', 'type': 'oily'},
        {'text': 'Medium-sized and balanced', 'type': 'normal'},
        {'text': 'Only large in some areas', 'type': 'combo'},
        {'text': 'Red and irritated around pores', 'type': 'sensitive'},
      ],
    },
    {
      'question': 'Does your skin feel oily at the end of the day?',
      'answers': [
        {'text': 'Never', 'type': 'dry'},
        {'text': 'Always', 'type': 'oily'},
        {'text': 'Only in the T-zone', 'type': 'combo'},
        {'text': 'Sometimes', 'type': 'normal'},
        {'text': 'Feels irritated rather than oily', 'type': 'sensitive'},
      ],
    },
    {
      'question': 'How does your skin react to skincare products?',
      'answers': [
        {'text': 'Absorbs moisturizer quickly', 'type': 'dry'},
        {'text': 'Feels greasy after applying products', 'type': 'oily'},
        {'text': 'Some areas absorb, others feel greasy', 'type': 'combo'},
        {'text': 'Gets red or irritated easily', 'type': 'sensitive'},
        {'text': 'Most products work fine', 'type': 'normal'},
      ],
    },
  ];

  void answerQuestion(String type) {
    setState(() {
      selectedAnswer = type;
    });
  }

  void nextQuestion() {
    if (selectedAnswer != null) {
      setState(() {
        if (selectedAnswer == 'dry') scoreDry++;
        if (selectedAnswer == 'oily') scoreOily++;
        if (selectedAnswer == 'combo') scoreCombo++;
        if (selectedAnswer == 'sensitive') scoreSensitive++;
        if (selectedAnswer == 'normal') scoreNormal++;

        selectedAnswer = null;
        questionIndex++;
      });
    }
  }

  String getSkinType() {
    Map<String, int> scores = {
      "Dry": scoreDry,
      "Oily": scoreOily,
      "Combination": scoreCombo,
      "Sensitive": scoreSensitive,
      "Normal": scoreNormal,
    };
    return scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  Future<void> saveSkinType(String newSkinType) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentReference userDoc =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      // Fetch user document
      DocumentSnapshot snapshot = await userDoc.get();

      // Convert snapshot data to a Map (handling null safety)
      Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>?;

      // Get existing skinType if it exists
      String? existingSkinType =
          (userData != null && userData.containsKey('skinType'))
              ? userData['skinType'] as String?
              : null;

      // If skinType is missing or different, update Firestore
      if (existingSkinType == null || existingSkinType != newSkinType) {
        await userDoc.set({'skinType': newSkinType}, SetOptions(merge: true));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text('Skin Type Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: questionIndex < questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${questionIndex + 1}/${questions.length}',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    questions[questionIndex]['question'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ...questions[questionIndex]['answers'].map<Widget>((answer) {
                    bool isSelected = selectedAnswer == answer['type'];
                    return GestureDetector(
                      onTap: () => answerQuestion(answer['type']),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: isSelected ? Colors.white : Colors.white),
                        ),
                        child: Text(
                          answer['text'],
                          style: TextStyle(
                            color: isSelected ? Colors.black : backgroundColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedAnswer == null ? Colors.black : Colors.white,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: selectedAnswer == null ? null : nextQuestion,
                    child: Text('Next'),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Skin Type: ${getSkinType()}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: backgroundColor,
                      ),
                      onPressed: () async {
                        String skinType = getSkinType();
                        await saveSkinType(skinType);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: Text('Go to Home Page'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
