import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/ui/page/add_to_cart_page.dart';
import 'package:grocery/ui/page/category_page.dart';
import 'package:grocery/ui/page/home_page.dart';
import 'package:grocery/ui/page/profile_page.dart';
import 'package:grocery/ui/page/wish_list_page.dart';
import 'package:grocery/ui/widget/bottom_bar_view.dart';
import 'package:grocery/ui/widget/tab_data.dart';
import 'package:grocery/utils/vars.dart';
import 'package:line_icons/line_icons.dart';

import 'common_drawer.dart';

class CommonScaffold extends StatefulWidget {
  final int selectedNavIndex;
  final Widget tabBody;

  const CommonScaffold(
      {Key key, this.selectedNavIndex, this.tabBody})
      : super(key: key);

  @override
  createState() => _CommonScaffoldState(
      selectedNavIndex: selectedNavIndex,
      tabBody: tabBody);
}

class _CommonScaffoldState extends State<CommonScaffold>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  int selectedNavIndex;
  Widget tabBody;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  _CommonScaffoldState(
      {Key key, this.selectedNavIndex = 0, this.tabBody});

  @override
  void initState() {
    for (TabIconData tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[selectedNavIndex].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey != null ? _scaffoldKey : null,
        appBar: appBarComponent(Row(children: <Widget>[
          GestureDetector(
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.grey.shade100,
                    child: CircleAvatar(radius: 10,
                        backgroundColor: Colors.transparent,
                        backgroundImage: ExactAssetImage(appIconImage))),
              )),
          SizedBox(width: 10),
          Text(appName, style: TextStyle(fontSize: 20.0, color: Colors.black))
        ])),
        drawer: CommonDrawer(),
        body: Stack(children: <Widget>[tabBody, bottomBar()]));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget bottomBar() {
    return Column(children: <Widget>[
      Expanded(child: SizedBox()),
      BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddToCartPage()));
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                tabBody = HomePage();
                setState(() {
                  selectedNavIndex = index;
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                tabBody = CategoryPage();
                setState(() {
                  selectedNavIndex = index;
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                tabBody = WishListPage();
                setState(() {
                  selectedNavIndex = index;
                });
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                tabBody = ProfilePage();
                setState(() {
                  selectedNavIndex = index;
                });
              });
            }
          })
    ]);
  }
}
