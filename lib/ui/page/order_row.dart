import 'package:flutter/material.dart';
import 'package:grocery/utils/vars.dart';

typedef void OrderCancelCallBack(String orderId);

class OrderRow extends StatelessWidget {
  final String orderId;
  final String name;
  final String email;
  final String mobile;
  final String address;
  final double price;
  final double totalAmount;
  final int quantity;
  final String status;
  final String orderDate;
  final String deliveryDate;
  final bool orderCancel;

  final OrderCancelCallBack onChange;

  OrderRow(
      this.orderId,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.price,
      this.totalAmount,
      this.quantity,
      this.status,
      this.orderDate,
      this.deliveryDate,
      this.orderCancel,
      {this.onChange});

  @override
  Widget build(BuildContext context) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            child: nameRow(name)),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            expandStyle(3, widgetOrderId(orderId)),
                            expandStyle(
                                2,
                                widgetPayAmount(
                                    totalAmount.toString(), status)),
                            expandStyle(
                                2, widgetOrderDate(orderDate, deliveryDate))
                          ]),
                      widgetName(name),
                      widgetAddress(address),
                      SizedBox(height: 1),
                      widgetMobile(mobile),
                      SizedBox(height: 1),
                      widgetDeliveryAddress(deliveryAddress),
                      SizedBox(height: 1),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            expandStyle(1, widgetQuantity(quantity.toString())),
                            expandStyle(
                                0,
                                orderCancel
                                    ? InkWell(
                                        child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(btnCancel,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0,
                                                    color: colorOrderCancel))),
                                        onTap: () => onChange(orderId))
                                    : Container())
                          ])
                    ])))
      ]);
}

//TODO PICK UP DETAIL WIDGETS
nameRow(String shopName) => Column(children: [
      GestureDetector(
          onTap: () {},
          child: CircleAvatar(
              radius: 18.0,
              child: Text(shopName.substring(0, 1),
                  style: TextStyle(
                      fontFamily: quickFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: colorRoundText)),
              backgroundColor: colorRoundTextBg))
    ]);

widgetOrderId(String orderId) => Column(children: [
      Text(
        orderId.contains(".") ? orderId.split(".")[0] : orderId,
        style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 15.0, color: colorOrderId),
      ),
      Container(
          color: colorOrderId,
          width: orderId.length <= 3 ? 7.0 * orderId.length : 21.0,
          height: 1.5)
    ], crossAxisAlignment: CrossAxisAlignment.start);

widgetOrderDate(String orderDate, String deliveryDate) =>
    Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
      Text(orderDate,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10.0,
              color: colorOrderCompleteDateTime)),
      Text(deliveryDate,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10.0,
              color: colorOrderAmount))
    ]);

widgetPayAmount(String payAmount, String orderStatus) =>
    Column(children: <Widget>[
      Text(symbolRs + double.parse(payAmount).toStringAsFixed(2),
          textAlign: TextAlign.right,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13.0,
              color: colorOrderPayAmount)),
      Text(orderStatus,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: quickFont,
              fontWeight: FontWeight.w700,
              fontSize: 11.0,
              color: Colors.black))
    ]);

widgetOrderAmount(String payAmount) => Text(
    payAmount.toString().isEmpty
        ? ''
        : symbolRs + double.parse(payAmount).toStringAsFixed(2),
    textAlign: TextAlign.right,
    style: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 13.0, color: colorOrderAmount));

widgetName(String shopName) => Container(
    margin: EdgeInsetsDirectional.only(top: 4.0),
    child: Text(shopName,
        style: TextStyle(
            fontFamily: quickFont,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: colorName)));

widgetAddress(String shopAddress) => Text(shopAddress,
    style: TextStyle(
        fontFamily: quickFont, fontSize: 13.0, color: colorShopAddress));

widgetMobile(String mobile) => Text(mobile,
    style:
        TextStyle(fontFamily: quickFont, fontSize: 14.0, color: colorMobile));

widgetDeliveryAddress(String address) => Padding(
    padding: const EdgeInsets.only(top: 3.0),
    child: Text(address,
        style: TextStyle(
            fontFamily: quickFont,
            letterSpacing: 0.5,
            fontSize: 14.0,
            color: colorDeliveryAddress)));

widgetQuantity(String deliveryType) => deliveryType.isEmpty
    ? Container()
    : Text('Item : ' + deliveryType,
        style: TextStyle(
            fontFamily: quickFont, fontSize: 14.0, color: Colors.black));

buttonTextStyle(String btnName) =>
    Text(btnName, style: TextStyle(fontFamily: quickFont, fontSize: 12.0));
