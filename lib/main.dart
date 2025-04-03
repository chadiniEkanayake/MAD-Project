import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart'; // ✅ Import HomePage
import 'sign_in_page.dart'; // ✅ Import SignInPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlowMate',
      theme: ThemeData(
        primaryColor: const Color(0xFF103c37), // Dark Green
        scaffoldBackgroundColor: const Color(0xFF103c37), // Background color
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF103c37), // Dark Green
          foregroundColor: Colors.white, // White text/icons
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const SplashScreen(), // ✅ Start with SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserSignIn(); // ✅ Check if user is signed in
  }

  Future<void> _checkUserSignIn() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate splash delay
    User? user = FirebaseAuth.instance.currentUser; // ✅ Check FirebaseAuth

    if (mounted) {
      if (user != null) {
        // ✅ Navigate to HomePage if already signed in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // ✅ Navigate to SignInPage if not signed in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF103c37),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'GlowMate',
              style: TextStyle(
                fontSize: 40, // ⬆️ Increased font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
                height: 10), // ⬇️ Reduced space between text and image
            ClipOval(
              child: Image.asset(
                'assets/images/welcomepage.jpg', // Ensure the image exists in assets
                width: 250, // ⬆️ Increased width
                height: 320, // ⬆️ Increased height for a larger oval
                fit: BoxFit.cover, // Ensure the image covers the oval shape
              ),
            ),
          ],
        ),
      ),
    );
  }
}
