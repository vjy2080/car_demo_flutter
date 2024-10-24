import 'package:demo_app_flutter/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeConstants.invertedColorScheme,
        border: Border.all(
          color: ThemeConstants.colorScheme,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: ThemeConstants.invertedColorScheme,
        radius: 15,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: ThemeConstants.colorScheme,
            size: 20,
          ),
        ),
      ),
    );
  }
}
