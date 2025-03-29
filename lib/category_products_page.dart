import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categoryName;

  const CategoryProductsPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          // 🔹 Query path adjusted to match Firestore structure
          stream: FirebaseFirestore.instance
              .collection('products') // Root collection
              .doc(categoryName) // Select category
              .collection('brands') // Select the brands subcollection
              .snapshots(), // Fetch the data
          builder: (context, brandSnapshot) {
            if (brandSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!brandSnapshot.hasData || brandSnapshot.data!.docs.isEmpty) {
              print("❌ No brands found for category: $categoryName");
              return const Center(child: Text("No brands available"));
            }

            // 🔹 Fetch products from each brand
            List<Future<QuerySnapshot>> productQueries =
                brandSnapshot.data!.docs.map((brandDoc) {
              return FirebaseFirestore.instance
                  .collection('products')
                  .doc(categoryName)
                  .collection('brands')
                  .doc(brandDoc.id)
                  .collection('products') // Products under each brand
                  .get();
            }).toList();

            return FutureBuilder<List<QuerySnapshot>>(
              future: Future.wait(productQueries),
              builder: (context, productSnapshot) {
                if (productSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!productSnapshot.hasData || productSnapshot.data!.isEmpty) {
                  return const Center(child: Text("No products available"));
                }

                // 🔹 Combine all products into a single list
                List<DocumentSnapshot> products = productSnapshot.data!
                    .expand((querySnap) => querySnap.docs)
                    .toList();

                return GridView.builder(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              productId: product.id,
                              productName: product['name'],
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                product['imageURL'],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/placeholder.png', // Local placeholder image
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.black.withOpacity(0.6),
                              width: double.infinity,
                              child: Text(
                                product['name'],
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
