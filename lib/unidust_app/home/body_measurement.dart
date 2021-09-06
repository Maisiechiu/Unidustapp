import 'package:flutter/material.dart';

class BodyMeasurementView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const BodyMeasurementView(
      {Key? key, this.animationController, this.animation})
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
              padding: const EdgeInsets.only(top: 30, bottom: 18),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.05, 1.05),
                          blurRadius: 2.0),
                    ],
                  ),
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 100,
                      child: Text("\n尚未新增任何紀錄\n或是記錄正在加載中",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500)))),
            ),
          ),
        );
      },
    );
  }
}
