import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  // Function to fetch user skin type from Firestore
  Future<String?> getUserSkinType() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return doc.exists ? doc['skinType'] : null; // If document exists, return skinType
    }
    return null; // Return null if the user is not authenticated
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserSkinType(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator()); // Loading state
        }

        String? skinType = snapshot.data; // Retrieved skin type
        if (skinType == null) {
          return const Center(child: Text('User skin type not found.'));
        }

        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('products')
              .where('skinType', isEqualTo: skinType)
              .snapshots(),
          builder: (context, streamSnapshot) {
            if (!streamSnapshot.hasData) {
              return const Center(child: CircularProgressIndicator()); // Loading state for products
            }

            var products = streamSnapshot.data!.docs;
            if (products.isEmpty) {
              return const Center(child: Text('No products found for your skin type.'));
            }

            return SizedBox(
              height: 250, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scroll view
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index].data() as Map<String, dynamic>;

                  // Error handling for missing product data
                  String productName = product['name'] ?? 'Unnamed Product';
                  String imageUrl = product['imageUrl'] ?? '';
                  imageUrl = imageUrl.isEmpty
                      ? 'assets/images/placeholder.png'
                      : imageUrl;

                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/placeholder.png', width: 100, height: 100); // Fallback image
                          },
                        ),
                        Text(productName),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
