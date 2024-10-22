import 'package:flutter/material.dart';
import 'components/sliver_app_bar.dart';
import 'components/info_section.dart';

class AnimatedScrollPage extends StatefulWidget {
  const AnimatedScrollPage({super.key});

  @override
  AnimatedScrollPageState createState() => AnimatedScrollPageState();
}

class AnimatedScrollPageState extends State<AnimatedScrollPage> {
  final ScrollController _scrollController = ScrollController();
  final double _imageHeight = 300.0;
  final String _imageUrl =
      "https://www.jarattours.co.za/wp-content/uploads/2021/07/E-Class-Exterior-11.jpg";
  final String _title = "Mercedes-Benz E-Class";
  bool isCollapsed = false;
  double _scaleFactor = 1.0;
  double _positionOffsetX = 0.0;
  double _positionOffsetY = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double scrollOffset = _scrollController.offset;
    bool newCollapsedState = scrollOffset >= _imageHeight - kToolbarHeight - 80;

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: _imageHeight,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: SliverAppBarContent(
                imageUrl: _imageUrl,
                title: _title,
                isCollapsed: isCollapsed,
                scaleFactor: _scaleFactor,
                positionOffsetX: _positionOffsetX,
                positionOffsetY: _positionOffsetY,
              ),
            ),
            SliverToBoxAdapter(
              child: InfoSection(
                title: _title,
                isCollapsed: isCollapsed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
