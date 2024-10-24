import 'package:demo_app_flutter/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverAppBarContent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isCollapsed;
  final double scaleFactor;
  final double positionOffsetX;
  final double positionOffsetY;

  const SliverAppBarContent({
    required this.imageUrl,
    required this.title,
    required this.isCollapsed,
    required this.scaleFactor,
    required this.positionOffsetX,
    required this.positionOffsetY,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Container(
      color: themeController.isDarkMode.value ? Colors.black : Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: FlexibleSpaceBar(
          centerTitle: true,
          title: isCollapsed && title.isNotEmpty && imageUrl.isNotEmpty
              ? Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.white, // Set the background color to white
                        radius: 15, // Adjust the radius to your liking
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color:
                                Colors.black, // Set icon color based on theme
                            size: 20, // Adjust the icon size if needed
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      // color: Colors.red,
                      width: 40.0,
                      child: Hero(
                        tag: 'imageHero$title',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                          radius: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Hero(
                        tag: 'titleHero$title',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.bodyLarge!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : null,
          background: !isCollapsed
              ? Transform.translate(
                  offset: Offset(positionOffsetX, positionOffsetY),
                  child: Transform.scale(
                    scale: scaleFactor,
                    child: Hero(
                      tag: 'imageHero$title',
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
