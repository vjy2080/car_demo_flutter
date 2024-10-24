import 'package:demo_app_flutter/components/animated_header.dart';
import 'package:demo_app_flutter/constants/theme_constants.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: ThemeConstants.colorScheme,
      child: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: FlexibleSpaceBar(
          centerTitle: true,
          title: isCollapsed && title.isNotEmpty && imageUrl.isNotEmpty
              ? Row(
                  children: [
                    AnimatedHeader(),
                    SizedBox(
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
                            style: textTheme.bodyLarge!,
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
