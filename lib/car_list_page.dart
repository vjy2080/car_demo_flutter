import 'package:demo_app_flutter/animated_scroll_page.dart';
import 'package:demo_app_flutter/car_data/car_list.dart';
import 'package:demo_app_flutter/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(
      () => Scaffold(
        backgroundColor:
            themeController.isDarkMode.value ? Colors.black : Colors.white,
        appBar: AppBar(
            leading: IconButton(
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              icon: Icon(themeController.isDarkMode.value
                  ? Icons.light_mode
                  : Icons.dark_mode),
              onPressed: () {
                themeController.toggleTheme();
              },
            ),
            backgroundColor:
                themeController.isDarkMode.value ? Colors.black : Colors.white,
            centerTitle: true, // Specifically for android.
            title: Text(
              'Car List',
              style: Theme.of(context).textTheme.headlineLarge!,
            )),
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
                backgroundColor: themeController.isDarkMode.value
                    ? Colors.black
                    : Colors.white,
                topLeftShadowBlurRadius: 15,
                topLeftShadowSpreadRadius: 1,
                topLeftShadowColor: themeController.isDarkMode.value
                    ? Colors.grey.shade900
                    : Colors.grey.shade300,
                bottomRightShadowColor: themeController.isDarkMode.value
                    ? Colors.grey.shade800
                    : Colors.grey.shade300,
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
                              style: Theme.of(context).textTheme.bodyLarge!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              car.description,
                              style: Theme.of(context).textTheme.bodySmall!,
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
