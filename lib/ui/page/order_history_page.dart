import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/orderhistory/order_history_bloc.dart';
import 'package:grocery/bloc/orderhistory/order_history_state.dart';
import 'package:grocery/model/orderhistory/order_history_item.dart';
import 'package:grocery/utils/vars.dart';
import 'package:line_icons/line_icons.dart';
import 'order_row.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistoryPage> {
  OrderHistoryBloc _orderHistoryBloc;
  TextEditingController _searchController = new TextEditingController();
  String filter;

  @override
  void initState() {
    super.initState();

    _orderHistoryBloc = BlocProvider.of<OrderHistoryBloc>(context);
    _orderHistoryBloc.userIdParam('1');
  }

  _bodyData() => BlocBuilder(
      bloc: _orderHistoryBloc,
      builder: (context, OrderHistoryState snapshot) => snapshot.loading
          ? Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)))
          : _bodyList(snapshot.orderHistoryItemList));

  _bodyList(List<OrderHistoryItem> orderHistoryItemList) =>
      Column(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: TextField(
                autocorrect: false,
                maxLines: 1,
                controller: _searchController,
                onChanged: (value) {
                  _orderHistoryBloc.searchInput(value);
                },
                decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: InkWell(
                        child: Icon(LineIcons.close, size: 18),
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => _searchController.clear());
                          _orderHistoryBloc.searchInput('');
                        })))),
        Expanded(
            child: ListView.builder(
                itemCount: orderHistoryItemList.length,
                itemBuilder: (context, position) => Card(
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.0),
                            top: Radius.circular(2.0))),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, orderHistoryDetailRoute),
                        child: Column(children: <Widget>[
                      OrderRow(
                          orderHistoryItemList[position].orderId,
                          orderHistoryItemList[position].name,
                          orderHistoryItemList[position].email,
                          orderHistoryItemList[position].mobile,
                          orderHistoryItemList[position].address,
                          orderHistoryItemList[position].price,
                          orderHistoryItemList[position].totalAmount,
                          orderHistoryItemList[position].quantity,
                          orderHistoryItemList[position].status,
                          orderHistoryItemList[position].orderDate,
                          orderHistoryItemList[position].deliveryDate,
                          orderHistoryItemList[position].orderCancel,
                          onChange: (String orderId) {
                        _orderHistoryBloc.orderCancel(orderId);
                      })
                    ])))))
      ]);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBarComponent(Row(children: <Widget>[
        Text(titleOrderHistory,
            style: TextStyle(fontSize: 20.0, color: Colors.black))
      ])),
      body: _bodyData());

  @override
  void dispose() {
    if (this.mounted) super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
