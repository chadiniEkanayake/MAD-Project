import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

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
    return FutureBuilder<String?>(
      future: getUserSkinType(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        String skinType = snapshot.data!;
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('products')
              .where('skinType', isEqualTo: skinType)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            var products = snapshot.data!.docs;
            return SizedBox(
              height: 250, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Moving grid effect
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index].data() as Map<String, dynamic>;
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          product['imageUrl'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/placeholder.jpg',
                                width: 100, height: 100);
                          },
                        ),
                        Text(product['name']),
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
