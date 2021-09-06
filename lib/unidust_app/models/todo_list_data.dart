import 'package:flutter/material.dart';
// import 'package:timeago/timeago.dart' as timeago;

class TodoListData {
  TodoListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<TodoListData> tabIconsList = <TodoListData>[
    TodoListData(
      imagePath: 'assets/unidust_app/breakfast.png',
      titleTxt: '目前尚無家事可以認領',
      kacl:0,
      meals: <String>[],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),

  ];
}
