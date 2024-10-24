import 'package:demo_app_flutter/pages/animated_scroll_page.dart';
import 'package:demo_app_flutter/car_data/car_list.dart';
import 'package:demo_app_flutter/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Scaffold(
        backgroundColor: ThemeConstants.colorScheme,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Hero(
              tag: 'appLogo',
              child: Image(
                image: AssetImage("images/logo.png"),
                width: 30, // Set the appropriate size for the image
                height: 30,
              ),
            ),
          ),
          backgroundColor: ThemeConstants.colorScheme,
          centerTitle: true,
          title: Text(
            'Car List',
            style: textTheme.headlineLarge!,
          ),
          actions: [
            IconButton(
              color: ThemeConstants.invertedColorScheme,
              icon: ThemeConstants.iconColor,
              onPressed: () {
                ThemeConstants.themeController.toggleTheme();
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final car = cars[index];
            return Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 16.0, right: 16.0),
              child: NeumorphicButton(
                borderRadius: 12,
                bottomRightShadowBlurRadius: 15,
                bottomRightShadowSpreadRadius: 1,
                borderWidth: 5,
                backgroundColor: ThemeConstants.colorScheme,
                topLeftShadowBlurRadius: 15,
                topLeftShadowSpreadRadius: 1,
                topLeftShadowColor: ThemeConstants.topLeftShadowColor,
                bottomRightShadowColor: ThemeConstants.bottomRightShadowColor,
                width: double.infinity,
                height: 100.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding: const EdgeInsets.all(0),
                bottomRightOffset: const Offset(0, 1),
                topLeftOffset: const Offset(-0, -1),
                onTap: () {
                  Get.to(() => AnimatedScrollPage(carModel: car));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'imageHero${car.title}',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(car.imageUrl),
                          radius: 40,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              car.title,
                              style: textTheme.bodyLarge!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              car.description,
                              style: textTheme.bodySmall!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
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
