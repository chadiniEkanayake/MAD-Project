import 'package:flutter/material.dart';

class ProductViewPage extends StatelessWidget {
  const ProductViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 List of Products with Firebase Image URLs
    final List<Map<String, String>> products = [
      {
        "name": "Moisturizer",
        "image": "https://via.placeholder.com/150" // Replace with Firebase URL
      },
      {"name": "Sun Screen", "image": "https://via.placeholder.com/150"},
      {"name": "Cleanser", "image": "https://via.placeholder.com/150"},
      {"name": "Toner", "image": "https://via.placeholder.com/150"},
      {"name": "Serum", "image": "https://via.placeholder.com/150"},
      {"name": "Body Wash", "image": "https://via.placeholder.com/150"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skin Care Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            var product = products[index];
            return GestureDetector(
              onTap: () {
                // 🔹 Navigate to ProductDetailPage with the selected product
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      productName: product['name']!,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    // 🔹 Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product['image']!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // 🔹 Text Overlay with Background
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.black.withOpacity(0.6),
                      width: double.infinity,
                      child: Text(
                        product['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
