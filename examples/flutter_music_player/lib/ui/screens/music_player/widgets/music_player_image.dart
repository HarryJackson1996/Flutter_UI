import 'package:flutter/material.dart';

class MusicPlayerImage extends StatelessWidget {
  final String? imagePath;
  final BoxShape boxShape;
  final AnimationController controller;

  const MusicPlayerImage({
    this.imagePath,
    this.boxShape = BoxShape.circle,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(controller),
        child: Container(
          decoration: BoxDecoration(
            shape: boxShape,
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage(
                imagePath ?? '',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
