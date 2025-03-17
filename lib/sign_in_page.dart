import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart'; // Import your Home page (to redirect after successful sign-in)

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = ''; // Store error messages to display

  // Sign-in function
  Future<void> _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      // Attempt to sign in
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the Home Page after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Error signing in: $e'; // Display error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlowMate Sign-In'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                backgroundColor: Color(0xFF097969),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),
            if (_errorMessage.isNotEmpty) ...[
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
