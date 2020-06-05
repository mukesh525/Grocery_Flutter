import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/category/category_bloc.dart';
import 'package:grocery/bloc/category/category_state.dart';
import 'package:grocery/model/category/category_description.dart';
import 'package:grocery/ui/cliper/new_indicator_clipper.dart';
import 'package:grocery/ui/widget/grocery_manage.dart';
import 'package:grocery/utils/vars.dart';

class AddToCartPage extends StatefulWidget {
  @override
  createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCartPage> {
  CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();

    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.addToCart();
    _categoryBloc.totalAmount();
  }

  _bodyData() => BlocBuilder(
      bloc: _categoryBloc,
      builder: (context, CategoryState snapshot) => snapshot.loading
          ? Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
            )
          : Column(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('Total Pay Amount $symbolRs',
                        style: TextStyle(fontSize: 12, color: Colors.grey))),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(_categoryBloc.state.totalAmount.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.teal)))
              ]),
              _categoryList(snapshot.addToCartList)
            ]));

  _categoryList(List<CategoryDescription> categoryDescriptionList) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: categoryDescriptionList.length,
          itemBuilder: (context, position) => Card(
              elevation: 0.3,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
                      Widget>[
                Flexible(
                    child: Stack(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, left: 10, right: 40),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: 70,
                                height: 70,
                                child: ClipOval(
                                  child: Image.asset('assets/images/' +
                                      categoryDescriptionList[position]
                                          .imageUrl),
                                )),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Text(
                                            categoryDescriptionList[position]
                                                .name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            categoryDescriptionList[position]
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
                                          categoryDescriptionList[position]
                                              .description,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54)),
                                    ]))
                          ])),
                  Positioned(
                      right: 0,
                      bottom: 5,
                      child: Row(children: <Widget>[
                        GroceryView(
                            initialCount:
                                categoryDescriptionList[position].quantity,
                            onChange: (int id) {
                              _categoryBloc.itemQuantity(
                                  categoryDescriptionList[position].id, id);
                            }),
                        SizedBox(width: 10),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                                (categoryDescriptionList[position].quantity *
                                        categoryDescriptionList[position].price)
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 11)))
                      ])),
                  Positioned(
                      left: 0,
                      top: 0,
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
              ])));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(appName,
                  style: TextStyle(fontSize: 20.0, color: Colors.black))
            ])),
        body: _bodyData(),
        bottomSheet:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                  onTap: () =>
                      Navigator.pushNamed(context, deliveryAddressRoute),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: gradientsButtonCheckOut),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(45)),
                    ),
                    child: Text(' ' + btnCheckout,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  )))
        ]));
  }
}
