import 'package:flutter/material.dart';
import 'feature_card.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final String description;
  final String design;
  final String performance;
  final String technology;
  final String safety;
  final bool isCollapsed;

  const InfoSection({
    required this.title,
    required this.description,
    required this.design,
    required this.performance,
    required this.technology,
    required this.safety,
    required this.isCollapsed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          if (!isCollapsed)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Hero(
                tag: 'titleHero$title',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.ellipsis,
                    // style: const TextStyle(
                    //   fontSize: 24,
                    //   fontWeight: FontWeight.w500,
                    //   color: Colors.red,
                    // ),
                  ),
                ),
              ),
            )
          else
            const SizedBox(height: 64),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.bodyLarge,
                  // style: TextStyle(
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                const SizedBox(height: 30),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,

                  // style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Key Features:',
                  style: Theme.of(context).textTheme.headlineLarge,

                  // style: TextStyle(
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                const SizedBox(height: 30),
                buildFeature('Design', design),
                buildFeature('Performance', performance),
                buildFeature('Technology', technology),
                buildFeature('Safety', safety),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeature(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FeatureCard(title: title, description: description),
    );
  }
}
