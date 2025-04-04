import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'skin_type_quiz.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  String? skinType;
  List<String> morningRoutine = [];
  List<String> nightRoutine = [];
  bool isLoading = true;
  String weatherCondition = "";
  double temperature = 0.0;

  // Weather API Key (Replace with your own)
  final String apiKey = "YOUR_OPENWEATHER_API_KEY";
  final String city = "Colombo"; // Change to user's location

  final Map<String, Map<String, List<String>>> defaultRoutines = {
    'Oily': {
      'Morning': ['Cleanser', 'Toner', 'Oil-Free Moisturizer', 'Sunscreen'],
      'Night': ['Cleanser', 'Exfoliate', 'Serum', 'Moisturizer'],
    },
    'Dry': {
      'Morning': ['Hydrating Cleanser', 'Moisturizer', 'Sunscreen'],
      'Night': ['Gentle Cleanser', 'Hydrating Serum', 'Heavy Moisturizer'],
    },
    'Combination': {
      'Morning': ['Gel Cleanser', 'Toner', 'Moisturizer', 'Sunscreen'],
      'Night': ['Cleanser', 'Serum', 'Night Cream'],
    },
    'Sensitive': {
      'Morning': ['Gentle Cleanser', 'Soothing Toner', 'Moisturizer', 'SPF'],
      'Night': ['Mild Cleanser', 'Healing Serum', 'Hydrating Cream'],
    },
    'Normal': {
      'Morning': ['Cleanser', 'Moisturizer', 'Sunscreen'],
      'Night': ['Cleanser', 'Serum', 'Night Moisturizer'],
    },
  };

  @override
  void initState() {
    super.initState();
    _fetchUserRoutine();
  }

  Future<void> _fetchUserRoutine() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists && doc.data() != null) {
        setState(() {
          skinType = doc.data()?['skinType'] as String?;

          if (skinType == null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SkinTypeQuizPage()),
            );
          } else {
            morningRoutine = List<String>.from(doc.data()?['morningRoutine'] ??
                defaultRoutines[skinType]?['Morning'] ??
                []);
            nightRoutine = List<String>.from(doc.data()?['nightRoutine'] ??
                defaultRoutines[skinType]?['Night'] ??
                []);
          }

          isLoading = false;
        });

        await _fetchWeather();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SkinTypeQuizPage()),
        );
      }
    }
  }

  Future<void> _fetchWeather() async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          weatherCondition = data["weather"][0]["main"];
          temperature = data["main"]["temp"];
        });

        _adjustRoutineForWeather();
      } else {
        print("Failed to fetch weather data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching weather: $e");
    }
  }

  void _adjustRoutineForWeather() {
    if (skinType == null) return;

    if (weatherCondition == "Rain" || weatherCondition == "Snow") {
      morningRoutine.add("Waterproof Sunscreen");
      nightRoutine.add("Extra Hydration Serum");
    } else if (temperature > 30) {
      morningRoutine.add("Cooling Gel Moisturizer");
      morningRoutine.add("SPF 50+ Sunscreen");
      nightRoutine.add("Aloe Vera Soothing Gel");
    } else if (temperature < 15) {
      morningRoutine.add("Extra Moisturizer");
      nightRoutine.add("Heavy Night Cream");
    }

    setState(() {});
  }

  Future<void> _saveRoutine() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'morningRoutine': morningRoutine,
        'nightRoutine': nightRoutine,
      }, SetOptions(merge: true));
    }
  }

  Widget _buildRoutineSection(String title, List<String> routine) {
    TextEditingController controller = TextEditingController();
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...List.generate(routine.length, (index) {
              return ListTile(
                title: Text(routine[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      routine.removeAt(index);
                    });
                  },
                ),
              );
            }),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add new step...",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        routine.add(controller.text);
                        controller.clear();
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Skincare Routine")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text("Skin Type: $skinType",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Weather: $weatherCondition",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text("Temperature: ${temperature.toStringAsFixed(1)}°C",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildRoutineSection("Morning Routine", morningRoutine),
                      _buildRoutineSection("Night Routine", nightRoutine),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _saveRoutine,
                  child: Text("Save Routine"),
                ),
              ],
            ),
    );
  }
}
