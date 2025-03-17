import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlowMate Home'),
      ),
      body: Center(
        child: Text(
          'Welcome to GlowMate!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
