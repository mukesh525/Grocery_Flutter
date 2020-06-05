import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/orderhistorydetail/order_history_bloc.dart';
import 'package:grocery/bloc/orderhistorydetail/order_history_detail_state.dart';
import 'package:grocery/model/orderhistorydetail/order_history_detail.dart';
import 'package:grocery/ui/cliper/new_indicator_clipper.dart';
import 'package:grocery/utils/vars.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  @override
  createState() => _OrderHistoryDetailState();
}

class _OrderHistoryDetailState extends State<OrderHistoryDetailPage> {
  OrderHistoryDetailBloc _orderHistoryDetailBloc;

  @override
  void initState() {
    super.initState();

    _orderHistoryDetailBloc = BlocProvider.of<OrderHistoryDetailBloc>(context);
    _orderHistoryDetailBloc.orderHistoryDetail('', '');
  }

  _bodyData() => BlocBuilder(
      bloc: _orderHistoryDetailBloc,
      builder: (context, OrderHistoryDetailState snapshot) => snapshot.loading
          ? Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
            )
          : Column(children: <Widget>[
              _categoryList(snapshot.orderHistoryDetailList)
            ]));

  _categoryList(List<OrderHistoryDetail> orderHistoryDetailList) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: orderHistoryDetailList.length,
          itemBuilder: (context, position) => Card(
              elevation: 0.3,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                                          orderHistoryDetailList[position]
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
                                                orderHistoryDetailList[position]
                                                    .name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                orderHistoryDetailList[position]
                                                        .isPiece
                                                    ? ' (Piece - ' +
                                                        orderHistoryDetailList[
                                                                position]
                                                            .noPiece
                                                            .toString() +
                                                        ')'
                                                    : '',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blueGrey)),
                                          ]),
                                          Text('Quantity: ' + orderHistoryDetailList[position].quantity.toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black54)),
                                        ]))
                              ])),
                      Positioned(
                          right: 0,
                          bottom: 5,
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                  (orderHistoryDetailList[position].quantity *
                                          orderHistoryDetailList[position]
                                              .price)
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 11)))),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: NewIndicator(
                              compact: false,
                              price: 'Rs. \n' +
                                  orderHistoryDetailList[position]
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
              Text(titleOrderHistoryDetail,
                  style: TextStyle(fontSize: 20.0, color: Colors.black))
            ])),
        body: _bodyData());
  }
}
