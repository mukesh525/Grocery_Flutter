import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:grocery/bloc/category/category_bloc.dart';
import 'package:grocery/bloc/category/category_state.dart';
import 'package:grocery/ui/cliper/tab_clipper.dart';
import 'package:line_icons/line_icons.dart';
import 'tab_data.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView(
      {Key key, this.tabIconsList, this.changeIndex, this.addClick})
      : super(key: key);

  final Function(int index) changeIndex;
  final Function addClick;
  final List<TabIconData> tabIconsList;
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  CategoryBloc _categoryBloc;

  @override
  void initState() {
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: <
            Widget>[
      AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Transform(
                transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                child: PhysicalShape(
                    color: Colors.white,
                    elevation: 2.0,
                    clipper: TabClipper(
                        radius: Tween<double>(begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                                    parent: animationController,
                                    curve: Curves.fastOutSlowIn))
                                .value *
                            38.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 50,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0),
                              child: Row(children: <Widget>[
                                Expanded(
                                  child: TabIcons(
                                      tabIconData: widget.tabIconsList[0],
                                      removeAllSelect: () {
                                        setRemoveAllSelection(
                                            widget.tabIconsList[0]);
                                        widget.changeIndex(0);
                                      }),
                                ),
                                Expanded(
                                    child: TabIcons(
                                        tabIconData: widget.tabIconsList[1],
                                        removeAllSelect: () {
                                          setRemoveAllSelection(
                                              widget.tabIconsList[1]);
                                          widget.changeIndex(1);
                                        })),
                                SizedBox(
                                    width: Tween<double>(begin: 0.0, end: 1.0)
                                            .animate(CurvedAnimation(
                                                parent: animationController,
                                                curve: Curves.fastOutSlowIn))
                                            .value *
                                        64.0),
                                Expanded(
                                    child: TabIcons(
                                        tabIconData: widget.tabIconsList[2],
                                        removeAllSelect: () {
                                          setRemoveAllSelection(
                                              widget.tabIconsList[2]);
                                          widget.changeIndex(2);
                                        })),
                                Expanded(
                                    child: TabIcons(
                                        tabIconData: widget.tabIconsList[3],
                                        removeAllSelect: () {
                                          setRemoveAllSelection(
                                              widget.tabIconsList[3]);
                                          widget.changeIndex(3);
                                        })),
                              ])))
                    ])));
          }),
      Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
              width: 23 * 2.0,
              height: 23 + 62.0,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: SizedBox(
                      width: 23 * 2.0,
                      height: 23 * 2.0,
                      child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ScaleTransition(
                              alignment: Alignment.center,
                              scale: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: animationController,
                                      curve: Curves.fastOutSlowIn)),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.white.withOpacity(0.1),
                                            Colors.grey.withOpacity(0.4),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      shape: BoxShape.circle,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            offset: const Offset(8.0, 10.0),
                                            blurRadius: 18.0)
                                      ]),
                                  child: BlocBuilder(
                                      bloc: _categoryBloc,
                                      builder:
                                          (context, CategoryState snapshot) =>
                                              Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      onTap: () =>
                                                          widget.addClick(),
                                                      child: Stack(
                                                          children: <Widget>[
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Icon(
                                                                    LineIcons
                                                                        .shopping_cart,
                                                                    size: 25,
                                                                    color: Colors
                                                                        .black45)),
                                                            Positioned(
                                                                right: 13.0,
                                                                top: 3,
                                                                child: Container(
                                                                    constraints: BoxConstraints(
                                                                        minWidth:
                                                                            20,
                                                                        minHeight:
                                                                            20),
                                                                    child: Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: Text(
                                                                            _categoryBloc.state.addToCartList.isEmpty
                                                                                ? '0'
                                                                                : (_categoryBloc.state.addToCartList.length).toString(),
                                                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10)))))
                                                          ])))))))))))
    ]));
  }

  void setRemoveAllSelection(TabIconData tabIconData) {
    if (!mounted) return;
    setState(() {
      widget.tabIconsList.forEach((TabIconData tab) {
        tab.isSelected = false;
        if (tabIconData.index == tab.index) {
          tab.isSelected = true;
        }
      });
    });
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({Key key, this.tabIconData, this.removeAllSelect})
      : super(key: key);

  final TabIconData tabIconData;
  final Function removeAllSelect;
  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) {
            return;
          }
          widget.removeAllSelect();
          widget.tabIconData.animationController.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Center(
            child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (!widget.tabIconData.isSelected) {
                    setAnimation();
                  }
                },
                child: IgnorePointer(
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                      ScaleTransition(
                          alignment: Alignment.center,
                          scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                              CurvedAnimation(
                                  parent:
                                      widget.tabIconData.animationController,
                                  curve: Interval(0.1, 1.0,
                                      curve: Curves.fastOutSlowIn))),
                          child: IconToggle(
                              activeColor: Colors.deepOrange,
                              selectedIconData: widget.tabIconData.iconData,
                              unselectedIconData: widget.tabIconData.iconData,
                              value: widget.tabIconData.isSelected)),
                      Positioned(
                          top: 4,
                          left: 6,
                          right: 0,
                          child: ScaleTransition(
                              alignment: Alignment.center,
                              scale: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: widget
                                          .tabIconData.animationController,
                                      curve: Interval(0.2, 1.0,
                                          curve: Curves.fastOutSlowIn))),
                              child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      shape: BoxShape.circle)))),
                      Positioned(
                          top: 0,
                          left: 6,
                          bottom: 8,
                          child: ScaleTransition(
                              alignment: Alignment.center,
                              scale: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: widget
                                          .tabIconData.animationController,
                                      curve: Interval(0.5, 0.8,
                                          curve: Curves.fastOutSlowIn))),
                              child: Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      shape: BoxShape.circle)))),
                      Positioned(
                          top: 6,
                          right: 5,
                          bottom: 0,
                          child: ScaleTransition(
                              alignment: Alignment.center,
                              scale: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: widget
                                          .tabIconData.animationController,
                                      curve: Interval(0.5, 0.6,
                                          curve: Curves.fastOutSlowIn))),
                              child: Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      shape: BoxShape.circle))))
                    ])))));
  }
}
