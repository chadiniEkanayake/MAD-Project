import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_detail_page.dart';
import 'profile.dart';
import 'sign_in_page.dart';
import 'skin_type_quiz.dart';
import 'product_page.dart';
import 'image_upload_page.dart';
import 'sign_up_page.dart';
import 'settings_page.dart';
import 'routine_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<String?> getUserSkinType() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return doc.exists ? doc['skinType'] : null;
    }
    return null;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                backgroundColor: Colors.white, foregroundColor: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SkinTypeQuizPage()));
            },
            child: const Text('Take the Quiz'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductViewPage()));
            },
            child: const Text('View Products'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.black),
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
                  // Skin type exists, navigate to RoutinePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RoutinePage()),
                  );
                } else {
                  // Skin type is missing, navigate to QuizPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SkinTypeQuizPage()),
                  );
                }
              }
            },
            child: const Text('View Your Skincare Routine'),
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
          const SizedBox(height: 20),

          // Recommended Products Section
          FutureBuilder<String?>(
            future: getUserSkinType(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Column(
                    children: [
                      const Text(
                        'Take the quiz to get personalized recommendations!',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SkinTypeQuizPage()));
                        },
                        child: const Text('Take Quiz Now'),
                      ),
                    ],
                  ),
                );
              }

              String skinType = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Text(
                      'Recommended for Your Skin Type ($skinType)',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .snapshots(),
                      builder: (context, categorySnapshot) {
                        if (categorySnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (!categorySnapshot.hasData ||
                            categorySnapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              'No products found for your skin type.',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                                              isEqualTo: skinType)
                                          .snapshots(),
                                      builder: (context, productSnapshot) {
                                        if (!productSnapshot.hasData ||
                                            productSnapshot
                                                .data!.docs.isEmpty) {
                                          return const SizedBox();
                                        }

                                        var products =
                                            productSnapshot.data!.docs;
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
                                                        width: 100,
                                                        height: 100),
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
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
