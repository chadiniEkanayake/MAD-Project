import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all users from Firestore
  Stream<QuerySnapshot> getUsers() {
    return _firestore.collection('users').snapshots();
  }

  // Fetch all products from Firestore
  Stream<QuerySnapshot> getProducts() {
    return _firestore.collection('products').snapshots();
  }

  // Method to delete a user
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  // Method to delete a product
  Future<void> deleteProduct(
      String categoryId, String brandId, String productId) async {
    try {
      await _firestore
          .collection('products')
          .doc(categoryId)
          .collection('brands')
          .doc(brandId)
          .collection('products')
          .doc(productId)
          .delete();
    } catch (e) {
      print("Error deleting product: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Manage Users Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Manage Users',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: getUsers(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      var users = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          var user = users[index];
                          String userId = user.id;
                          String userName = user['name'] ?? 'No name';
                          return ListTile(
                            title: Text(userName),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteUser(userId),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            // Manage Products Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Manage Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: getProducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      var categories = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          var category = categories[index];
                          String categoryId = category.id;

                          return ExpansionTile(
                            title: Text(categoryId),
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                stream: category.reference
                                    .collection('brands')
                                    .snapshots(),
                                builder: (context, brandSnapshot) {
                                  if (!brandSnapshot.hasData) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  var brands = brandSnapshot.data!.docs;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: brands.length,
                                    itemBuilder: (context, index) {
                                      var brand = brands[index];
                                      String brandId = brand.id;

                                      return ExpansionTile(
                                        title: Text(brandId),
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                            stream: brand.reference
                                                .collection('products')
                                                .snapshots(),
                                            builder:
                                                (context, productSnapshot) {
                                              if (!productSnapshot.hasData) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }

                                              var products =
                                                  productSnapshot.data!.docs;
                                              return ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: products.length,
                                                itemBuilder: (context, index) {
                                                  var product = products[index];
                                                  String productId = product.id;
                                                  String productName =
                                                      product['name'] ??
                                                          'No name';
                                                  return ListTile(
                                                    title: Text(productName),
                                                    trailing: IconButton(
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      onPressed: () =>
                                                          deleteProduct(
                                                              categoryId,
                                                              brandId,
                                                              productId),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
