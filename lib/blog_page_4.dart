import 'package:flutter/material.dart';

class BlogPage4 extends StatelessWidget {
  const BlogPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Natural Remedies for Glowing Skin'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/natural_skin_remedies.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Honey and Lemon Mask',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Honey has natural antibacterial properties that help with acne and pimples, while lemon contains vitamin C, which brightens and evens out the skin tone. To use this remedy, mix a tablespoon of honey with a few drops of lemon juice. Apply it to your face for 15-20 minutes before rinsing off with lukewarm water.',
            ),
            const SizedBox(height: 20),
            const Text(
              '2. Aloe Vera Gel',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Aloe vera is known for its soothing properties. It helps calm irritated skin, reduce redness, and promote a clear complexion. Simply apply fresh aloe vera gel directly from the plant onto your skin, leave it on for 15 minutes, and rinse it off with warm water.',
            ),
            const SizedBox(height: 20),
            const Text(
              '3. Turmeric Face Pack',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Turmeric is a powerful antioxidant and anti-inflammatory. It can help brighten your skin and reduce dark spots. To create a turmeric face pack, mix a small amount of turmeric powder with honey or yogurt to form a paste. Apply the paste to your face for 10-15 minutes, then wash it off with lukewarm water.',
            ),
            const SizedBox(height: 20),
            const Text(
              '4. Coconut Oil Massage',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Coconut oil is deeply moisturizing and can improve skin texture. Gently massage warm coconut oil into your skin in circular motions for a few minutes. Leave it on for 20-30 minutes before washing it off. This is ideal for dry or dull skin types.',
            ),
            const SizedBox(height: 20),
            const Text(
              '5. Cucumber Face Mask',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cucumber is hydrating and helps in cooling the skin, making it perfect for a glowing complexion. To make a cucumber face mask, blend fresh cucumber slices into a smooth paste and apply it to your face for 10-15 minutes. Rinse off with cool water for an instant refreshing effect.',
            ),
            const SizedBox(height: 20),
            const Text(
              '6. Green Tea Toner',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Green tea is packed with antioxidants and can help with skin inflammation. To make a simple green tea toner, brew a cup of green tea and let it cool. Use a cotton pad to apply the tea to your face after cleansing. It can tighten pores and reduce puffiness.',
            ),
            const SizedBox(height: 20),
            const Text(
              '7. Avocado Face Mask',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Avocados are rich in healthy fats and vitamins, making them an excellent moisturizer. Mash half an avocado and apply it to your face for 10-15 minutes. Rinse it off to reveal soft, glowing skin.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Final Thoughts on Natural Remedies for Glowing Skin',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'While natural remedies can significantly enhance your skin’s glow, it’s important to remember that consistency is key. Additionally, always patch test before using any new ingredients on your face to avoid allergic reactions. Eating a balanced diet, staying hydrated, and following a healthy skincare routine will also contribute to glowing skin.',
            ),
          ],
        ),
      ),
    );
  }
}
