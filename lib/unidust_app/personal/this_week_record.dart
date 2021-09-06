import 'package:flutter/material.dart';

class WeekRecordView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const WeekRecordView({Key? key, this.animationController, this.animation})
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
                Container(child: Image.asset('assets/unidust_app/record_chore.png'))),
          ),
        );
      },
    );
  }
}
