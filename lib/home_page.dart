import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glowmate/profile.dart';
import 'sign_in_page.dart';
import 'skin_type_quiz.dart';
import 'product_page.dart'; // Ensure correct import
import 'image_upload_page.dart'; // Import the image upload page
import 'sign_up_page.dart'; // Import the Sign Up page
import 'settings_page.dart'; // Import the Settings page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GlowMate Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                // If user is signed in, go to ProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              } else {
                // If user is NOT signed in, go to SignInPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              }
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      // Drawer with color adjustments
      drawer: Drawer(
        backgroundColor: Colors.white, // Set background color to white
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // Set header background color to white
              ),
              child: Text(
                'GlowMate Menu',
                style: TextStyle(
                  color: Colors.black, // Set text color to black
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Sign Up',
                  style: TextStyle(color: Colors.black)), // Black text
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Settings',
                  style: TextStyle(color: Colors.black)), // Black text
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Welcome to GlowMate!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SkinTypeQuizPage()),
              );
            },
            child: const Text('Take the Quiz'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductViewPage()),
              );
            },
            child: const Text('View Products'),
          ),
          const SizedBox(height: 10),
          // New button to navigate to the image upload page
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ImageUploadPage()), // Navigate to ImageUploadPage
              );
            },
            child: const Text('Upload Product Image'),
          ),
        ],
      ),
    );
  }
}
