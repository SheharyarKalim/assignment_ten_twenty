import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static final AppColors _instance = AppColors._();

  static AppColors get instance => _instance;
  final black = const Color(0XFF2E2739);
  final white = const Color(0XFFFFFFFF);
  final liteWhite = const Color(0XFFF6F6FA);
  final listGradient = const [Color(0XFFEFEFEF), Color(0XFFF2F2F6)];
  final genresColorList = const [
    Color(0XFF15D2BC),
    Color(0XFFCD9D0F),
    Color(0XFFE26CA5),
    Color(0XFF564CA3),
    Color(0XFF61C3F2)
  ];
  final grey = const Color(0XFF827D88);
  final liteGrey = const Color(0XFFDBDBDF);
  final liteBlue = const Color(0XFF61C3F2);
  final seaGreen = const Color(0XFF15D2BC);
  final pink = const Color(0XFFE26CA5);
  final purple = const Color(0XFF564CA3);
  final golden = const Color(0XFFCD9D0F);
  final background = const Color(0XFF3D3D3D);
  final titleColor = const Color(0XFF202C43);
}
