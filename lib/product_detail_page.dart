import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  final String category;
  final String brand;
  final String productName;
  final String imageUrl;

  const ProductDetailPage({
    super.key,
    required this.productId,
    required this.category,
    required this.brand,
    required this.productName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('products')
            .doc(category)
            .collection('brands')
            .doc(brand)
            .collection('products')
            .doc(productId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Product not found"));
          }

          var product = snapshot.data!.data() as Map<String, dynamic>;

          String description = product.containsKey('description')
              ? product['description']
              : 'No description available.';
          String skinType = product.containsKey('skinType')
              ? product['skinType']
              : 'Not categorized';

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    imageUrl,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/placeholder.png', // Placeholder image path
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  productName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(description, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Skin Type: $skinType",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
