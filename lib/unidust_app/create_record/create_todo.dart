import '../../app_theme.dart';
import '../../my_flutter_app_icons.dart';
import '../../utils/authentication.dart';
import '../../utils/firebase_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTodoPage extends StatefulWidget {
  // final String title ;
  // TabTestPage(this.title,{Key key}) : super(key:key);
  @override
  _CreateTodoPage createState() => _CreateTodoPage();

  CreateTodoPage();
}

class _CreateTodoPage extends State<CreateTodoPage> {
  late final _ratingController;
  late double _rating;
  double _initialRating = 2.0;
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _personController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool isSubmitEnable = false;

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
                      context, '/create/create_record');
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  height: 45,
                  width: 160,
                  child: Text(
                    "新增代辦家務 ▴",
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
                          ),
                        ),
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
                      Text("Monday,Sep.2",
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
                      Text('時間',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      Text("7:30 PM",
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
                      Text('附註',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _noteController,
                    style: TextStyle(fontSize: 17, height: 1),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        /*边角*/
                        borderRadius: BorderRadius.all(
                          Radius.circular(10), //边角为30
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2, //边线宽度为2
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white10,
                        width: 2,
                      )),
                      hintText: "幫我做這項家事因為我...",
                      filled: true,
                      fillColor: Color(0xFFF4F3ED),
                    ),
                  ),
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
                                    await Firestore(email).addTodo(
                                      _personController.text,
                                      _inputController.text,
                                      _noteController.text,
                                    );
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

  void _onInputChanged() {
    if (_inputController.text.isNotEmpty && _personController.text.isNotEmpty) {
      setState(() {
        isSubmitEnable = true;
      });
    } else {
      setState(() {
        if (_inputController.text.isEmpty) {
          print("家務填寫不完整");
        }
        if (_personController.text.isEmpty) {
          print("暱稱填寫不完整");
        }
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
