import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TabIconData {
  TabIconData(
      {this.index = 0,
      this.isSelected = false,
      this.iconData,
      this.animationController});

  bool isSelected;
  int index;
  IconData iconData;

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
        iconData: LineIcons.home,
        index: 0,
        isSelected: true,
        animationController: null),
    TabIconData(
        iconData: LineIcons.desktop,
        index: 1,
        isSelected: false,
        animationController: null),
    TabIconData(
        iconData: LineIcons.heart_o,
        index: 2,
        isSelected: false,
        animationController: null),
    TabIconData(
        iconData: LineIcons.user,
        index: 3,
        isSelected: false,
        animationController: null)
  ];
}
