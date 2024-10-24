import 'package:demo_app_flutter/components/info_section.dart';
import 'package:demo_app_flutter/components/sliver_app_bar.dart';
import 'package:demo_app_flutter/controller/theme_controller.dart';
import 'package:demo_app_flutter/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedScrollPage extends StatefulWidget {
  final CarModel carModel;

  const AnimatedScrollPage({required this.carModel, super.key});

  @override
  AnimatedScrollPageState createState() => AnimatedScrollPageState();
}

class AnimatedScrollPageState extends State<AnimatedScrollPage> {
  final ScrollController _scrollController = ScrollController();
  late final double _imageHeight;
  late bool isCollapsed = false;
  double _scaleFactor = 1.0;
  double _positionOffsetX = 0.0;
  double _positionOffsetY = 0.0;

  @override
  void initState() {
    super.initState();
    _imageHeight = 300.0;
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double scrollOffset = _scrollController.offset;
    bool newCollapsedState = scrollOffset >= _imageHeight - kToolbarHeight - 40;

    if (newCollapsedState != isCollapsed) {
      setState(() {
        isCollapsed = newCollapsedState;
      });
    }

    setState(() {
      _scaleFactor = (1 - (scrollOffset / 300)).clamp(0.5, 1.0);
      _positionOffsetX = (scrollOffset * -0.57).clamp(-80.0, 0.0);
      _positionOffsetY = (scrollOffset * -0.08).clamp(-35.0, 0.0);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      backgroundColor:
          themeController.isDarkMode.value ? Colors.black : Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: _imageHeight,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: SliverAppBarContent(
              imageUrl: widget.carModel.imageUrl,
              title: widget.carModel.title,
              isCollapsed: isCollapsed,
              scaleFactor: _scaleFactor,
              positionOffsetX: _positionOffsetX,
              positionOffsetY: _positionOffsetY,
            ),
            leading: isCollapsed
                ? null
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Make sure the shape is a circle
                      color: Colors
                          .white, // Set the background color of the avatar
                      border: Border.all(
                        color: Colors.black, // Set the border color
                        width: 1, // Set the border thickness
                      ),
                    ),
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
                          color: Colors.black, // Set icon color based on theme
                          size: 20, // Adjust the icon size if needed
                        ),
                      ),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: InfoSection(
              title: widget.carModel.title,
              description: widget.carModel.description,
              design: widget.carModel.design,
              performance: widget.carModel.performance,
              technology: widget.carModel.technology,
              safety: widget.carModel.safety,
              isCollapsed: isCollapsed,
            ),
          ),
        ],
      ),
    );
  }
}
