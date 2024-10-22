import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const FeatureCard({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,

          // style: const TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        const SizedBox(height: 15),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,

          // style: const TextStyle(
          //   fontSize: 16,
          // ),
        ),
      ],
    );
  }
}
