import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'feature_card.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final bool isCollapsed;

  const InfoSection({
    required this.title,
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
                tag: 'titleHero',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
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
                const Text(
                  'The Mercedes-Benz E-Class is a luxury sedan, part of the executive car class produced by the German automaker Mercedes-Benz. Renowned for its blend of comfort, advanced technology, and performance, the E-Class sits between the smaller C-Class and the flagship S-Class in Mercedes\' lineup. It’s often seen as a symbol of sophistication and engineering excellence.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Key Features:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                buildFeature('Design',
                    'The E-Class boasts a sleek, modern exterior with a signature grille, LED headlights, and flowing lines. Inside, it offers a premium cabin with high-quality materials like leather, wood, and metal accents, as well as ambient lighting.'),
                buildFeature('Performance',
                    'Available in various engine configurations, from turbocharged four-cylinders to V8s in AMG variants. It combines smooth driving dynamics with advanced suspension for a comfortable yet agile ride.'),
                buildFeature('Technology',
                    'The E-Class is packed with cutting-edge tech, including the MBUX infotainment system, voice control, dual-screen display, and driver assistance features like adaptive cruise control and semi-autonomous driving.'),
                buildFeature('Safety',
                    'Known for its safety, the E-Class is equipped with features like collision avoidance, automated emergency braking, and a suite of airbags and reinforcements for passenger protection.'),
                const SizedBox(height: 20),
                const Text(
                  'Available in sedan, coupe, cabriolet, and wagon body styles, the E-Class offers luxury and performance in a versatile package.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeature(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FeatureCard(title: title, description: description),
    );
  }
}
