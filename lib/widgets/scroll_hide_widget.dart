import 'package:flutter/material.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollToHideWidget({
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
    Key? key,
  }) : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool _isVisible = true;

  @override
  initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);

    super.dispose();
  }

  void listen() {
    // final direction = widget.controller.position.userScrollDirection;
    // if (direction == ScrollDirection.forward) {
    //   show();
    // } else if (direction == ScrollDirection.reverse) {
    //   hide();
    // }
    if (widget.controller.position.pixels >= 100) {
      hide();
    } else
      show();
  }

  void show() {
    if (!_isVisible) {
      setState(() {
        _isVisible = true;
      });
    }
  }

  void hide() {
    if (_isVisible) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: _isVisible ? kBottomNavigationBarHeight : 0,
      child: widget.child,
    );
  }
}
