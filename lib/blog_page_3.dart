import 'package:flutter/material.dart';

class BlogPage3 extends StatelessWidget {
  const BlogPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Treat Acne'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/acne_treatment.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'Understanding Acne and Its Causes',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Acne is a common skin condition caused by clogged pores, excessive oil production, bacteria, and inflammation. Understanding the causes of acne can help in choosing the right treatment. Factors such as genetics, hormonal imbalances, diet, and stress can all contribute to the development of acne. It’s important to note that acne can affect people of all skin types, though certain products may be more suitable for specific skin concerns.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 1: Use a Gentle Cleanser',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'The first step in treating acne is using a gentle, non-comedogenic (won\'t clog pores) cleanser. Here are some tips for choosing the right cleanser:',
            ),
            const SizedBox(height: 10),
            const Text(
              '- Choose a mild cleanser with ingredients like salicylic acid or benzoyl peroxide.\n- Avoid harsh scrubs that can irritate your skin and worsen acne.\n- Cleanse twice a day—morning and night—to remove dirt and excess oil.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 2: Apply Spot Treatment',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Spot treatments are a great way to target individual pimples. Here are some options to consider:',
            ),
            const SizedBox(height: 10),
            const Text(
              '- Use benzoyl peroxide or salicylic acid spot treatments to reduce inflammation and kill bacteria.\n- Apply spot treatments directly on the affected area after cleansing and before moisturizing.\n- Be careful not to overuse spot treatments, as they can dry out your skin.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 3: Moisturize Your Skin',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Even though your skin may be oily, it is still important to use a moisturizer. Use a lightweight, oil-free moisturizer to prevent your skin from becoming dry and irritated while treating acne.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 4: Consider Topical Retinoids',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Topical retinoids are a common treatment for acne, as they help promote cell turnover and prevent clogged pores. They can be found in over-the-counter products or prescribed by a dermatologist. Start by using them sparingly and gradually increase frequency to prevent irritation.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Step 5: Protect Your Skin from the Sun',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Using sunscreen is crucial when treating acne, especially when using products like retinoids that can make your skin more sensitive to the sun. Opt for a non-comedogenic sunscreen with SPF 30 or higher to protect your skin from UV damage.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Additional Tips for Treating Acne',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '- Avoid touching your face to prevent transferring bacteria and oil.\n- Change your pillowcases regularly to avoid bacterial buildup.\n- Be patient—acne treatments can take time to show results.\n- Consult a dermatologist if over-the-counter treatments aren’t effective.',
            ),
          ],
        ),
      ),
    );
  }
}
