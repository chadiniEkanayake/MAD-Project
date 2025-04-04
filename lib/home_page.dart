import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glowmate/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product_detail_page.dart';
import 'profile.dart';
import 'sign_in_page.dart';
import 'skin_type_quiz.dart';
import 'product_page.dart';
import 'image_upload_page.dart';
import 'sign_up_page.dart';
import 'settings_page.dart';
import 'routine_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? weatherCondition;
  String? skinCareTip;
  String? userSkinType;

  @override
  void initState() {
    super.initState();
    fetchWeatherAndSetTip();
    getUserSkinType();
  }

  Future<void> fetchWeatherAndSetTip() async {
    const String apiKey = "b3b4bb75b173db188b9a3c40878c3339";
    const String city = "Colombo";
    const String apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String condition = data['weather'][0]['main'];
        setState(() {
          weatherCondition = condition;
          skinCareTip = getSkinCareTip(condition);
        });
      }
    } catch (e) {
      setState(() {
        weatherCondition = "Unknown";
        skinCareTip = "Stay hydrated and take care of your skin!";
      });
    }
  }

  String getSkinCareTip(String condition) {
    switch (condition) {
      case "Clear":
        return "Use sunscreen to protect your skin from UV rays!";
      case "Clouds":
        return "Moisturize well to keep your skin hydrated!";
      case "Rain":
        return "Avoid heavy makeup and use waterproof sunscreen!";
      case "Snow":
        return "Keep your skin moisturized with a hydrating cream!";
      case "Wind":
        return "Use a protective moisturizer to shield your skin from dryness!";
      default:
        return "Stay hydrated and take care of your skin!";
    }
  }

  Future<void> getUserSkinType() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (mounted) {
        setState(() {
          userSkinType = (doc.exists &&
                  doc.data() != null &&
                  (doc.data() as Map<String, dynamic>).containsKey('skinType'))
              ? doc['skinType']
              : null;
        });
      }
    }
  }

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                'GlowMate Menu',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            ListTile(
              title:
                  const Text('Sign Up', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
            ),
            ListTile(
              title:
                  const Text('Settings', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Weather-based Skin Protection Tip Box
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Weather: ${weatherCondition ?? 'Loading...'}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      skinCareTip ?? 'Fetching skincare tip...',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Grid-like button layout
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Rectangular box shape
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SkinTypeQuizPage()),
                      );
                    },
                    child: const Text('Take the Quiz'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Rectangular box shape
                      ),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Rectangular box shape
                      ),
                    ),
                    onPressed: () async {
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        DocumentSnapshot doc = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .get();

                        if (doc.exists &&
                            doc.data() != null &&
                            doc['skinType'] != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RoutinePage()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SkinTypeQuizPage()),
                          );
                        }
                      }
                    },
                    child: const Text('View Your Skincare Routine'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      print("Navigating to BlogViewPage...");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BlogViewPage(),
                        ),
                      );
                    },
                    child: const Text('View Blogs'),
                  ),
                ],
              ),
            ),

            // Recommended Products Based on Skin Type
            if (userSkinType != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text(
                  'Recommended for Your Skin Type ($userSkinType)',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            if (userSkinType != null)
              SizedBox(
                height: 250,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (context, categorySnapshot) {
                    if (categorySnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!categorySnapshot.hasData ||
                        categorySnapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          'No products found for your skin type.',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      );
                    }

                    var productDocs = categorySnapshot.data!.docs;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productDocs.length,
                      itemBuilder: (context, index) {
                        var category = productDocs[index].id;
                        return StreamBuilder<QuerySnapshot>(
                          stream: productDocs[index]
                              .reference
                              .collection('brands')
                              .snapshots(),
                          builder: (context, brandSnapshot) {
                            if (!brandSnapshot.hasData ||
                                brandSnapshot.data!.docs.isEmpty) {
                              return const SizedBox();
                            }

                            var brandDocs = brandSnapshot.data!.docs;
                            return Row(
                              children: brandDocs.map((brandDoc) {
                                return StreamBuilder<QuerySnapshot>(
                                  stream: brandDoc.reference
                                      .collection('products')
                                      .where('skinType',
                                          isEqualTo: userSkinType)
                                      .snapshots(),
                                  builder: (context, productSnapshot) {
                                    if (!productSnapshot.hasData ||
                                        productSnapshot.data!.docs.isEmpty) {
                                      return const SizedBox();
                                    }

                                    var products = productSnapshot.data!.docs;
                                    return Row(
                                      children: products.map((product) {
                                        var productData = product.data()
                                            as Map<String, dynamic>;
                                        String productName =
                                            productData['name'] ??
                                                'No name available';
                                        String imageUrl =
                                            productData['imageURL'] ?? '';
                                        String productId = product.id;

                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailPage(
                                                  productId: productId,
                                                  category: category,
                                                  brand: brandDoc.id,
                                                  productName: productName,
                                                  imageUrl: imageUrl,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Image.network(imageUrl,
                                                    width: 100, height: 100),
                                                Text(productName),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageUploadPage()));
              },
              child: const Text('Upload Product Image'),
            ),
          ],
        ),
      ),
    );
  }
}
