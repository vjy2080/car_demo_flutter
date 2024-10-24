import 'package:demo_app_flutter/components/feature_card.dart';
import 'package:demo_app_flutter/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  Widget buildFeature(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FeatureCard(title: title, description: description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final textTheme = Theme.of(context).textTheme;
      return Container(
        color: ThemeConstants.infoBackgroundColorScheme,
        child: Column(
          children: [
            if (!isCollapsed)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Hero(
                  tag: 'titleHero$title',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      title,
                      style: textTheme.headlineLarge!,
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
                    'Description',
                    style: textTheme.headlineMedium!,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    style: textTheme.bodySmall!,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Key Features:',
                    style: textTheme.headlineMedium!,
                  ),
                  const SizedBox(height: 10),
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
    });
  }
}
