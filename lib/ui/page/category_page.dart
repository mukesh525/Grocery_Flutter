import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/category/category_bloc.dart';
import 'package:grocery/bloc/category/category_state.dart';
import 'package:grocery/model/category/category_description.dart';
import 'package:grocery/ui/cliper/new_indicator_clipper.dart';
import 'package:grocery/utils/vars.dart';
import 'package:line_icons/line_icons.dart';

class CategoryPage extends StatefulWidget {
  @override
  createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  CategoryBloc _categoryBloc;
  final controller = PageController(viewportFraction: 1);

  @override
  void initState() {
    super.initState();

    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.category();
  }

  _bodyData() => BlocBuilder(
      bloc: _categoryBloc,
      builder: (context, CategoryState snapshot) => snapshot.loading
          ? Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
            )
          : _categoryList(snapshot.categoryDescriptionList));

  _categoryList(List<CategoryDescription> categoryDescriptionList) => Container(
      margin: EdgeInsets.only(bottom: 60),
      child: ListView.builder(
          itemCount: categoryDescriptionList.length,
          itemBuilder: (context, position) => Card(elevation: 0.3,
                  child: Row(children: <Widget>[
                Flexible(
                    child: Stack(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, left: 10, right: 40),
                      child: Column(children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(child: Container(
                                      width: 70,
                                      height: 70,
                                      child: ClipOval(
                                        child: Image.asset('assets/images/' +
                                            categoryDescriptionList[position]
                                                .imageUrl),
                                      ))),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(children: <Widget>[
                                              Text(
                                                  categoryDescriptionList[
                                                          position]
                                                      .name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  categoryDescriptionList[
                                                              position]
                                                          .isPiece
                                                      ? ' (Piece - ' +
                                                          categoryDescriptionList[
                                                                  position]
                                                              .noPiece
                                                              .toString() +
                                                          ')'
                                                      : '',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blueGrey)),
                                            ]),
                                            Text(
                                                categoryDescriptionList[
                                                        position]
                                                    .description,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54))
                                          ]))
                                ]))
                      ])),
                  Positioned(
                      right: 10,
                      bottom: 10,
                      child: Row(children: <Widget>[
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                                splashColor: Colors.grey
                                    .withOpacity(0.1), // splash color
                                onTap: () => _categoryBloc.isAddItem(
                                    categoryDescriptionList[position]
                                        .id), // button pressed
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                        categoryDescriptionList[position]
                                                .isAddItem
                                            ? 'DELETE'
                                            : 'ADD ITEM',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 11))))),
                        SizedBox(width: 10),

                        SizedBox.fromSize(
                            size: Size(30, 30), // button width and height
                            child: ClipOval(
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        splashColor: Colors.grey
                                            .withOpacity(0.1), // splash color
                                        onTap: () => _categoryBloc.isFavourite(
                                            categoryDescriptionList[position]
                                                .id), // button pressed
                                        child: Icon(
                                            categoryDescriptionList[position]
                                                    .isFavourite
                                                ? LineIcons.heart
                                                : LineIcons.heart_o,
                                            color: categoryDescriptionList[
                                                        position]
                                                    .isFavourite
                                                ? Colors.deepOrange
                                                : Colors.grey)))))
                      ])),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: NewIndicator(
                          compact: false,
                          price: 'Rs. \n' +
                              categoryDescriptionList[position]
                                  .price
                                  .toString()))
                ]))
              ]))));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _bodyData());
  }
}
