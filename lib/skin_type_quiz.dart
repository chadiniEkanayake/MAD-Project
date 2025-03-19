import 'package:flutter/material.dart';

class SkinTypeQuizPage extends StatefulWidget {
  @override
  _SkinTypeQuizPageState createState() => _SkinTypeQuizPageState();
}

class _SkinTypeQuizPageState extends State<SkinTypeQuizPage> {
  final Color backgroundColor = Color(0xFF424D42);
  int scoreDry = 0,
      scoreOily = 0,
      scoreCombo = 0,
      scoreSensitive = 0,
      scoreNormal = 0;
  int questionIndex = 0;

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
      if (type == 'dry') scoreDry++;
      if (type == 'oily') scoreOily++;
      if (type == 'combo') scoreCombo++;
      if (type == 'sensitive') scoreSensitive++;
      if (type == 'normal') scoreNormal++;
      questionIndex++;
    });
  }

  String getSkinType() {
    Map<String, int> scores = {
      "Dry Skin": scoreDry,
      "Oily Skin": scoreOily,
      "Combination Skin": scoreCombo,
      "Sensitive Skin": scoreSensitive,
      "Normal Skin": scoreNormal,
    };

    // Determine the skin type with the highest score
    String skinType =
        scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    return skinType;
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
                    questions[questionIndex]['question'],
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ...questions[questionIndex]['answers'].map<Widget>((answer) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: backgroundColor,
                      ),
                      onPressed: () => answerQuestion(answer['type']),
                      child: Text(answer['text']),
                    );
                  }).toList(),
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
                      onPressed: () {
                        setState(() {
                          scoreDry = 0;
                          scoreOily = 0;
                          scoreCombo = 0;
                          scoreSensitive = 0;
                          scoreNormal = 0;
                          questionIndex = 0;
                        });
                      },
                      child: Text('Retake Quiz'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
