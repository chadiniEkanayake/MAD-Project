import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add Firestore import
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  final ImagePicker _picker = ImagePicker();
  String? _imageUrl;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

  // Function to pick and upload image to Firebase
  Future<void> _uploadImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    File file = File(pickedFile.path);

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference storageReference =
          FirebaseStorage.instance.ref().child('product_images/$fileName');
      UploadTask uploadTask = storageReference.putFile(file);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _imageUrl = downloadUrl;
      });

      // Save product details to Firestore
      await FirebaseFirestore.instance.collection('products').add({
        'name': _productNameController.text,
        'description': _productDescriptionController.text,
        'imageUrl': downloadUrl,
      });

      // ignore: avoid_print
      print('Image and product details uploaded successfully!');
    } catch (e) {
      // ignore: avoid_print
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Product Image')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: _productDescriptionController,
                decoration:
                    const InputDecoration(labelText: 'Product Description'),
              ),
              ElevatedButton(
                onPressed: _uploadImage,
                child: const Text('Pick and Upload Image'),
              ),
              const SizedBox(height: 20),
              if (_imageUrl != null)
                Column(
                  children: [
                    Image.network(_imageUrl!),
                    Text('Image URL: $_imageUrl'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
