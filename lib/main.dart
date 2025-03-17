import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// Import your Sign-In page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlowMate', // Set the app's title
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a loading process and navigate after 6 seconds
    Future.delayed(Duration(seconds: 6), () {
      // After the delay, navigate to another screen (e.g., HomeScreen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424d42), // Set the background color
      appBar: AppBar(
        backgroundColor: Color(0xFF424d42), // Match the background color
        elevation: 0, // Remove app bar shadow
      ),
      body: Center(
        child: Text(
          'GlowMate', // GlowMate text
          style: TextStyle(
            fontSize: 60, // Increase the font size
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Color(0xFF424d42),
      ),
      body: Center(
        child: Text('Welcome to GlowMate!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
