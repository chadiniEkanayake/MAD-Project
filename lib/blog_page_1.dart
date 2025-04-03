<<<<<<< HEAD
import 'package:flutter/material.dart';

class BlogPage1 extends StatelessWidget {
  const BlogPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Ultimate Guide to Building a Skincare Routine'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/skincare_routine.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'A solid skincare routine is essential for maintaining healthy, radiant skin. However, with so many products available on the market, knowing where to start can be overwhelming. The key to a successful skincare routine is understanding your skin type and tailoring your products accordingly. This guide will walk you through the steps needed to build an effective skincare routine that suits your skin’s unique needs.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 1: Know Your Skin Type',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'The first step in creating a skincare routine is understanding your skin type. There are generally four main skin types: oily, dry, combination, and sensitive skin. Each type has specific needs, and choosing the right products for your skin type is crucial for achieving the best results.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Oily Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Oily skin produces excess sebum, leading to a shiny appearance and the potential for breakouts. This skin type benefits from oil-free, mattifying products that help control shine and reduce clogged pores.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dry Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dry skin lacks moisture and can feel tight or flaky. It needs hydrating and nourishing products that help replenish moisture and keep the skin soft and smooth.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Combination Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This skin type is a mix of oily and dry areas, typically an oily T-zone with dry or normal cheeks. For combination skin, you\'ll need a balance of products that hydrate without making the skin greasy.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sensitive Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sensitive skin is prone to redness, irritation, and allergic reactions. It requires gentle, fragrance-free formulas that are designed to soothe and calm the skin.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 2: Cleansing',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cleansing is essential for removing dirt, oil, and makeup from your skin. It prepares your skin for the next steps in your routine and helps prevent breakouts and irritation. Make sure to use a gentle cleanser suitable for your skin type. Oily skin can benefit from gel-based cleansers, while dry skin might need a cream-based formula that adds moisture.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 3: Exfoliation',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Exfoliating helps to remove dead skin cells and promote cell turnover, leading to smoother, more youthful-looking skin. It can also help with acne prevention by preventing clogged pores. Exfoliate 2-3 times a week, using a gentle scrub or chemical exfoliant such as AHAs or BHAs.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 4: Toning',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Toners help balance the pH of your skin and remove any leftover dirt or cleanser. Choose a toner based on your skin type. For dry skin, a hydrating toner with ingredients like hyaluronic acid will work best. For oily skin, astringent toners with witch hazel can help control excess oil.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 5: Moisturizing',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Moisturizing is essential for all skin types, as it helps lock in hydration and keep the skin soft and supple. Choose a moisturizer that suits your skin type: gel-based formulas for oily skin, cream-based for dry skin, and lightweight lotions for combination skin.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 6: Sunscreen',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sunscreen is the final step in your skincare routine and one of the most important. Apply broad-spectrum SPF 30 or higher every morning, even on cloudy days, to protect your skin from harmful UVA and UVB rays. Reapply every 2 hours when exposed to the sun.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Final Tips for a Successful Skincare Routine',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '- Stay consistent; results take time.\n'
              '- Drink plenty of water and eat a healthy diet for glowing skin.\n'
              '- Adjust your routine based on seasonal changes.\n'
              '- Avoid touching your face to prevent breakouts.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class BlogPage1 extends StatelessWidget {
  const BlogPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Ultimate Guide to Building a Skincare Routine'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/skincare_routine.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'A solid skincare routine is essential for maintaining healthy, radiant skin. However, with so many products available on the market, knowing where to start can be overwhelming. The key to a successful skincare routine is understanding your skin type and tailoring your products accordingly. This guide will walk you through the steps needed to build an effective skincare routine that suits your skin’s unique needs.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 1: Know Your Skin Type',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'The first step in creating a skincare routine is understanding your skin type. There are generally four main skin types: oily, dry, combination, and sensitive skin. Each type has specific needs, and choosing the right products for your skin type is crucial for achieving the best results.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Oily Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Oily skin produces excess sebum, leading to a shiny appearance and the potential for breakouts. This skin type benefits from oil-free, mattifying products that help control shine and reduce clogged pores.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dry Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dry skin lacks moisture and can feel tight or flaky. It needs hydrating and nourishing products that help replenish moisture and keep the skin soft and smooth.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Combination Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This skin type is a mix of oily and dry areas, typically an oily T-zone with dry or normal cheeks. For combination skin, you\'ll need a balance of products that hydrate without making the skin greasy.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sensitive Skin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sensitive skin is prone to redness, irritation, and allergic reactions. It requires gentle, fragrance-free formulas that are designed to soothe and calm the skin.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 2: Cleansing',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cleansing is essential for removing dirt, oil, and makeup from your skin. It prepares your skin for the next steps in your routine and helps prevent breakouts and irritation. Make sure to use a gentle cleanser suitable for your skin type. Oily skin can benefit from gel-based cleansers, while dry skin might need a cream-based formula that adds moisture.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 3: Exfoliation',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Exfoliating helps to remove dead skin cells and promote cell turnover, leading to smoother, more youthful-looking skin. It can also help with acne prevention by preventing clogged pores. Exfoliate 2-3 times a week, using a gentle scrub or chemical exfoliant such as AHAs or BHAs.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 4: Toning',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Toners help balance the pH of your skin and remove any leftover dirt or cleanser. Choose a toner based on your skin type. For dry skin, a hydrating toner with ingredients like hyaluronic acid will work best. For oily skin, astringent toners with witch hazel can help control excess oil.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 5: Moisturizing',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Moisturizing is essential for all skin types, as it helps lock in hydration and keep the skin soft and supple. Choose a moisturizer that suits your skin type: gel-based formulas for oily skin, cream-based for dry skin, and lightweight lotions for combination skin.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 6: Sunscreen',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sunscreen is the final step in your skincare routine and one of the most important. Apply broad-spectrum SPF 30 or higher every morning, even on cloudy days, to protect your skin from harmful UVA and UVB rays. Reapply every 2 hours when exposed to the sun.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Final Tips for a Successful Skincare Routine',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '- Stay consistent; results take time.\n'
              '- Drink plenty of water and eat a healthy diet for glowing skin.\n'
              '- Adjust your routine based on seasonal changes.\n'
              '- Avoid touching your face to prevent breakouts.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> b831f8f8b4d2497407cea03d751b5bf945c74c29
