import 'package:flutter/material.dart';

class BlogPage5 extends StatelessWidget {
  const BlogPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Skincare Mistakes You Should Avoid'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/skincare_mistakes.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Skipping Sunscreen Daily',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'One of the most common and harmful skincare mistakes is neglecting to apply sunscreen. Sun exposure leads to premature aging, wrinkles, and increased risk of skin cancer. You should apply sunscreen with at least SPF 30 every morning, even on cloudy days. Reapply every 2 hours when outdoors.',
            ),
            const SizedBox(height: 20),
            const Text(
              '2. Over-Exfoliating Your Skin',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Exfoliating is important to remove dead skin cells, but overdoing it can lead to irritation, dryness, and even breakouts. Limit exfoliation to 2-3 times per week and use gentle exfoliants, either physical scrubs or chemical exfoliants like AHAs/BHAs.',
            ),
            const SizedBox(height: 20),
            const Text(
              '3. Using Harsh Products for Sensitive Skin',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'If you have sensitive skin, avoid products that contain harsh chemicals, alcohol, or fragrances. These can cause irritation, redness, and flare-ups. Instead, opt for gentle, fragrance-free products designed for sensitive skin, and always patch-test new products.',
            ),
            const SizedBox(height: 20),
            const Text(
              '4. Not Removing Makeup Before Bed',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Leaving makeup on overnight can clog your pores, leading to breakouts and dull skin. Always double cleanse—first with a makeup remover or micellar water, followed by a gentle cleanser to thoroughly remove any leftover product.',
            ),
            const SizedBox(height: 20),
            const Text(
              '5. Using Too Many Products at Once',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'While layering skincare products can be effective, using too many at once can overwhelm your skin and lead to irritation or clogged pores. Stick to a basic routine with a cleanser, toner, moisturizer, and sunscreen, then add targeted treatments if necessary.',
            ),
            const SizedBox(height: 20),
            const Text(
              '6. Not Moisturizing Enough',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Moisturizing is essential for maintaining a healthy skin barrier, even if you have oily skin. Skipping this step can lead to dryness, tightness, and irritation. Choose a lightweight, non-comedogenic moisturizer if you have oily skin, and a richer cream for dry skin.',
            ),
            const SizedBox(height: 20),
            const Text(
              '7. Ignoring Your Neck and Chest',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'When applying skincare, don’t forget your neck and chest. These areas are often exposed to the sun and show signs of aging just like your face. Extend your skincare routine to these areas to prevent wrinkles, discoloration, and sagging.',
            ),
            const SizedBox(height: 20),
            const Text(
              '8. Touching Your Face Too Often',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Touching your face repeatedly can transfer bacteria, dirt, and oils to your skin, leading to breakouts and irritation. Make a habit of keeping your hands away from your face, especially when you’re out and about.',
            ),
            const SizedBox(height: 20),
            const Text(
              '9. Overusing Skin Treatments',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'While products like retinoids, vitamin C serums, and acne treatments are highly effective, using them too frequently or in high concentrations can cause dryness, irritation, and peeling. Follow product instructions and introduce new products gradually into your routine.',
            ),
            const SizedBox(height: 20),
            const Text(
              '10. Not Being Consistent',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Consistency is key in any skincare routine. Skipping steps or not following through with your routine will yield slower or minimal results. Stick with a regular regimen, and give products time to work before introducing new ones.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Final Thoughts on Avoiding Skincare Mistakes',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Avoiding these common skincare mistakes can significantly improve your skin health and appearance. Be patient with your skincare journey, and remember that everyone’s skin is different. Pay attention to how your skin reacts to products and adapt your routine accordingly.',
            ),
          ],
        ),
      ),
    );
  }
}
