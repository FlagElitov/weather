import 'package:flutter/cupertino.dart';

class AnimatedInitialLogo extends StatefulWidget {
  @override
  _AnimatedInitialLogoState createState() => _AnimatedInitialLogoState();
}

class _AnimatedInitialLogoState extends State<AnimatedInitialLogo>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _sizeAnimation;

  bool reverse = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.repeat(reverse: !reverse);
              reverse = !reverse;
            }
          });

    _sizeAnimation =
        Tween<double>(begin: 140.0, end: 160.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) => Image.asset(
        'assets/images/logo.png',
        width: _sizeAnimation.value,
        height: _sizeAnimation.value,
      ),
    );
  }
}
