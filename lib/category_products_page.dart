import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categoryName;

  const CategoryProductsPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Categories that accidentally have a space in Firestore
    List<String> categoriesWithSpace = ["Toner", "Cleanser", "Moisturizer"];

    // Add a space if the category is in the list
    String correctedCategoryName = categoriesWithSpace.contains(categoryName)
        ? "$categoryName " // Ensure space after the name
        : categoryName;

    // Debugging output to confirm path correction
    print(
        'Querying path for category: /products/$correctedCategoryName/brands');

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('products')
              .doc(correctedCategoryName)
              .collection('brands')
              .snapshots(),
          builder: (context, brandSnapshot) {
            if (brandSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!brandSnapshot.hasData || brandSnapshot.data!.docs.isEmpty) {
              print('No brands found for category: $correctedCategoryName');
              return const Center(child: Text("No brands available"));
            }

            print('Found brands: ${brandSnapshot.data!.docs.length}');

            // Fetch products from each brand
            List<Future<QuerySnapshot>> productQueries =
                brandSnapshot.data!.docs.map((brandDoc) {
              return FirebaseFirestore.instance
                  .collection('products')
                  .doc(correctedCategoryName)
                  .collection('brands')
                  .doc(brandDoc.id)
                  .collection('products')
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
                  print(
                      'No products available for category: $correctedCategoryName');
                  return const Center(child: Text("No products available"));
                }

                print('Found products: ${productSnapshot.data!.length}');

                // Combine all products into a single list
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
                    var productData =
                        product.data() as Map<String, dynamic>? ?? {};

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              productId: product.id,
                              category: correctedCategoryName,
                              brand: product.reference.parent.parent!.id,
                              productName:
                                  productData['name'] ?? 'Unknown Product',
                              imageUrl: productData['imageURL'] ?? '',
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
                                productData['imageURL'] ?? '',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/placeholder.png',
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
                                productData['name'] ?? 'Unknown Product',
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
