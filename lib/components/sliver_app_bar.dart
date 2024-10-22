import 'package:flutter/material.dart';

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
    return FlexibleSpaceBar(
      centerTitle: false,
      title: isCollapsed
          ? Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
                Hero(
                  tag: 'titleHero$title',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
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
    );
  }
}
