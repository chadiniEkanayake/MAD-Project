import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(SkincareBlogApp());
}

class SkincareBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skincare Blogs',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlogGridScreen(),
    );
  }
}

class BlogGridScreen extends StatelessWidget {
  final List<Map<String, String>> blogs = [
    {'title': 'Healthy Skin Routine', 'url': 'https://example.com/blog1'},
    {'title': 'Acne Prevention Tips', 'url': 'https://example.com/blog2'},
    {'title': 'Moisturizing Hacks', 'url': 'https://example.com/blog3'},
    {'title': 'Best Anti-Aging Products', 'url': 'https://example.com/blog4'},
    {'title': 'Sunscreen Importance', 'url': 'https://example.com/blog5'},
    {'title': 'DIY Face Masks', 'url': 'https://example.com/blog6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skincare Blogs')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: blogs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BlogWebView(url: blogs[index]['url']!),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    blogs[index]['title']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BlogWebView extends StatelessWidget {
  final String url;

  BlogWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blog Article')),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
