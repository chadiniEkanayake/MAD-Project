import 'package:flutter/material.dart';
import 'blog_page_1.dart';
import 'blog_page_2.dart';
import 'blog_page_3.dart';
import 'blog_page_4.dart';
import 'blog_page_5.dart';

class BlogViewPage extends StatelessWidget {
  const BlogViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> blogs = [
      {
        'title': 'The Ultimate Guide to Building a Skincare Routine',
        'page': BlogPage1(),
        'image': 'assets/images/skincare_routine.jpg'
      },
      // {
      //   'title': 'Choose the Right Skincare Products for Your Skin Type',
      //   'page': BlogPage2(),
      //   'image': 'assets/images/choose_skincare.jpg'
      // },
      // {
      //   'title': 'How to Treat Acne',
      //   'page': BlogPage3(),
      //   'image': 'assets/images/acne_treatment.jpg'
      // },
      // {
      //   'title': 'Natural Remedies for Glowing Skin',
      //   // 'page': BlogPage4(),
      //   'image': 'assets/images/natural_remedies.jpg'
      // },
      // {
      //   'title': 'Common Skincare Mistakes You Should Avoid',
      //   // 'page': BlogPage5(),
      //   'image': 'assets/images/skincare_mistakes.jpg'
      // },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skincare Blogs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: blogs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => blogs[index]['page']),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(
                        blogs[index]['image'] != null &&
                                blogs[index]['image'] is String
                            ? blogs[index]['image']
                            : 'assets/default_image.png',
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/placeholder.png');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        blogs[index]['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
