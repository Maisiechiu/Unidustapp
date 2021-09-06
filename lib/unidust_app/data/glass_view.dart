import 'package:flutter/material.dart';

class GlassView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const GlassView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 16, bottom: 18),
                child:
                Container(child: Image.asset('assets/unidust_app/data_1.png'))),
          ),
        );
      },
    );
  }
}
