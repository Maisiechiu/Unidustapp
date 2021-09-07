import '../../app_theme.dart';
import '../../my_flutter_app_icons.dart';
import '../../utils/authentication.dart';
import '../../utils/firebase_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CreateRecordPage extends StatefulWidget {
  @override
  _CreateRecordPage createState() => _CreateRecordPage();
}

class _CreateRecordPage extends State<CreateRecordPage> {
  late final _ratingController;
  late double _rating;
  late double span;
  bool isSubmitEnable = true;
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _personController = TextEditingController();
  double _initialRating = 2.0;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
    _inputController.addListener(_onInputChanged);
    _personController.addListener(_onInputChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Material(
            child: new Ink(
              decoration: new BoxDecoration(
                color: Color(0xFFFFD84C),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, '/create/create_todo');
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  height: 45,
                  width: 160,
                  child: Text(
                    "新增家務紀錄 ▾",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: AppTheme.Yellow,
        ),
        body: GestureDetector(
          onTap: () {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 30, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF4F3ED),
                        ),
                        child: IconButton(
                          icon: Icon(MyFlutterApp.clean),
                          onPressed: () {},
                          iconSize: 25,
                          splashRadius: 50,
                        ),
                      ),
                      SizedBox(
                        width: 258.0,
                        height: 45,
                        child: TextField(
                            controller: _inputController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                /*边角*/
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10), //边角为30
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent, //边线颜色为黄色
                                  width: 2, //边线宽度为2
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white10, //边框颜色为绿色
                                width: 2, //宽度为5
                              )),
                              labelText: "家務名稱",
                              hintText: "請輸入家務名稱",
                              filled: true,
                              fillColor: Color(0xFFF4F3ED),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 30, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF4F3ED),
                          ),
                          child: Icon(Icons.face_rounded)),
                      SizedBox(
                        width: 258.0,
                        height: 45,
                        child: TextField(
                            controller: _personController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                /*边角*/
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10), //边角为30
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent, //边线颜色为黄色
                                  width: 2, //边线宽度为2
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white10, //边框颜色为绿色
                                width: 2, //宽度为5
                              )),
                              labelText: "姓名或暱稱",
                              hintText: "請輸入姓名或暱稱",
                              filled: true,
                              fillColor: Color(0xFFF4F3ED),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('日期',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      Text("今天",
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('你喜歡做這個家務嗎?',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 380,
                  child: _ratingBar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('花費時間',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 223,
                  height: 223,
                  child: slider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 15),
                  child: AnimatedContainer(
                    height: 45,
                    width: 160,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeIn,
                    child: Material(
                      child: new Ink(
                        decoration: new BoxDecoration(
                          color: Color(0xFFFFD84C),
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        child: InkWell(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0)),
                          onTap: () {
                            isSubmitEnable
                                ? () async {
                                    String email =
                                        await Authentication.getUser()
                                            as String;
                                    await Firestore(email).addChore(
                                        _personController.text,
                                        _inputController.text,
                                        _rating,
                                        span);
                                    _inputController.clear();
                                    _personController.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("輸入成功")));
                                    Navigator.pop(context);
                                  }()
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("請完整填寫家務名稱以及暱稱或姓名")));
                          },
                          child: Container(
                            alignment: Alignment(0, 0),
                            height: 45,
                            width: 160,
                            child: Text(
                              "確定新增",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget slider() {
    return SleekCircularSlider(
        max: 60,
        initialValue: 15,
        appearance: CircularSliderAppearance(
          startAngle: 270,
          angleRange: 360,
          customColors: CustomSliderColors(
            trackColor: Color(0xFFF4F3ED),
            dotColor: Colors.black,
            progressBarColor: Color(0xFFFFD84C),
          ),
          customWidths: CustomSliderWidths(
            trackWidth: 25,
            progressBarWidth: 25,
            shadowWidth: 0,
            handlerSize: 13,
          ),
          infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(fontSize: 62),
              bottomLabelText: "min",
              bottomLabelStyle:
                  TextStyle(fontSize: 20, color: Color(0xff969696)),
              modifier: (double value) {
                final span = value.ceil().toInt().toString();
                return '$span';
              }),
        ),
        onChange: (double value) {
          setState(() {
            span = value;
          });
        });
  }

  Widget _ratingBar() {
    return RatingBar.builder(
      initialRating: 2.0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      unratedColor: Color(0xFFF4F3ED),
      itemCount: 5,
      itemSize: 50.0,
      itemPadding: EdgeInsets.all(4),
      itemBuilder: (context, _) => Icon(
        Icons.favorite,
        color: Color(0xFFFFD84C),
      ),
      wrapAlignment: WrapAlignment.start,
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }

  void _onInputChanged() {
    if (_inputController.text.isNotEmpty && _personController.text.isNotEmpty) {
      setState(() {
        isSubmitEnable = true;
      });
    } else {
      setState(() {
        isSubmitEnable = false;
      });
    }
  }

  @override
  void dispose() {
    _inputController.dispose();
    _personController.dispose();
    super.dispose();
  }
}

// void createRecord(
//     String person, String housework, double span, double like) async {
//   await Firestore.instance.collection("user/housework").document().setData({
//     'person': person,
//     'housework': housework,
//     'time': Timestamp.now(),
//     'time_span': span,
//     'like': like,
//   });
// }
