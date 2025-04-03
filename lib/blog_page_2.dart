import 'package:flutter/material.dart';

class BlogPage2 extends StatelessWidget {
  const BlogPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Choose the Right Skincare Products for Your Skin Type'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/skincare_products.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'Choosing the right skincare products is essential for maintaining healthy, glowing skin, but it all starts with understanding your skin type. Oily skin tends to produce excess sebum, leading to shine and breakouts, requiring lightweight, oil-free products. Dry skin, on the other hand, lacks moisture, often feeling tight or flaky, making hydrating and nourishing products a necessity. Combination skin features both oily and dry areas, usually with an oily T-zone and drier cheeks, requiring a balanced approach. Sensitive skin is prone to redness and irritation, needing gentle, fragrance-free formulas. The first step in a skincare routine is cleansing. Your choice of cleanser should align with your skin’s needs—gel or foaming cleansers with salicylic acid are best for oily skin, while cream-based cleansers with hydrating ingredients work well for dry skin. Combination skin benefits from gentle foaming cleansers, whereas sensitive skin requires fragrance-free, soothing options with ingredients like chamomile or aloe. Next comes moisturizing, a crucial step for all skin types. Oily skin does well with lightweight gel moisturizers containing hyaluronic acid, while dry skin thrives with rich, creamy moisturizers infused with ceramides. Those with combination skin can benefit from a mix of gel and cream-based moisturizers, and people with sensitive skin should opt for hypoallergenic formulas with calming ingredients. Serums offer targeted treatment for specific skin concerns. Oily skin benefits from niacinamide or BHA serums to control excess oil, while dry skin should look for hyaluronic acid serums for deep hydration. Combination skin can use vitamin C serums for balance and radiance, and sensitive skin responds well to peptide serums for soothing and repair. Sunscreen is the most critical step in any skincare routine, as it protects the skin from premature aging and UV damage. Oily skin should opt for lightweight, matte-finish SPF, while dry skin needs hydrating SPF with added moisturizers. Sensitive skin types should choose mineral sunscreens with zinc oxide or titanium dioxide to prevent irritation. When selecting skincare products, always patch-test new products before applying them to your face to avoid potential reactions. Avoid harsh alcohols, artificial fragrances, and sulfates, as they can cause irritation. Additionally, adjusting your skincare routine based on seasonal changes can help your skin stay balanced throughout the year.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
