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
      centerTitle: true,
      title: isCollapsed
          ? Row(
              children: [
                const SizedBox(width: 20),
                Hero(
                  tag: 'imageHero',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 40,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Hero(
                    tag: 'titleHero',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
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
                  tag: 'imageHero',
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
