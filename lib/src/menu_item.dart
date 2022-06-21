import 'package:flutter/material.dart';

abstract class MenuItemProvider {
  String get menuTitle;
  dynamic get menuUserInfo;
  Widget? get menuImage;
  TextStyle get menuTextStyle;
  TextAlign get menuTextAlign;
}

/// Default menu item
class CustomMenuItem extends MenuItemProvider {
  Widget? image;
  String title;
  dynamic userInfo; // 额外的菜单荐信息
  TextStyle textStyle;
  TextAlign textAlign;

  CustomMenuItem({
    this.title = "",
    this.image,
    this.userInfo,
    this.textStyle = const TextStyle(
      color: Color(0xffc5c5c5),
      fontSize: 10.0,
    ),
    this.textAlign = TextAlign.center,
  });

  factory CustomMenuItem.forList({
    required String title,
    Widget? image,
    dynamic userInfo,
    TextStyle textStyle = const TextStyle(
      color: Color(0xFF181818),
      fontSize: 10.0,
    ),
    TextAlign textAlign = TextAlign.center,
  }) {
    return CustomMenuItem(
      title: title,
      image: image,
      userInfo: userInfo,
      textAlign: textAlign,
      textStyle: textStyle,
    );
  }

  @override
  Widget? get menuImage => image;

  @override
  String get menuTitle => title;

  @override
  dynamic get menuUserInfo => userInfo;

  @override
  TextStyle get menuTextStyle => textStyle;

  @override
  TextAlign get menuTextAlign => textAlign;
}
