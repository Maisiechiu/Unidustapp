import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DustbieView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const DustbieView({Key? key, this.animationController, this.animation})
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
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F3ED),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                  child:new  Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20, top: 10,bottom:10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Dustbie   ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Lv. 1",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 10,),
                        child: new LinearPercentIndicator(
                          width: 170.0,
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 10.0,
                          trailing: new Text("0/100",style:TextStyle(color:Color(0xFF050504))),
                          percent: 0.0,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Color(0xFFFFD84C),
                          backgroundColor: Color(0xFF333333),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Row(children: <Widget>[
                          Icon(Icons.favorite, color: Color(0xFFFF6060)),
                          Text("  0")
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: new Image.asset(
                          "assets/unidust_app/dustbie.png",
                          width: 113,
                          height: 130,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 20,
                        ),
                        child: new Image.asset(
                          "assets/unidust_app/shadow.png",
                          width: 113,
                          height: 31,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 280 , bottom:30),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD84C),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("本周累積時數",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)),
                              Text("0 hr 0 min ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600))
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 210 ,right:15 , bottom: 15 ),
                        child: Text(
                          "使Dustbie成長了0%",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
