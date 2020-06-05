import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/ui/cliper/shape_cliper.dart';
import 'package:grocery/utils/hexacolor.dart';
import 'package:grocery/utils/vars.dart';

class DashBoardPage extends StatefulWidget {
  @override
  createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardPage> {
  final List<String> washShopStatus = [
    'PROCESS',
    'COMPLETE',
    'PENDING',
    'CANCEL'
  ];

  _bodyData() => Stack(children: <Widget>[
        Container(
            child: CustomPaint(
                painter: ShapesPainter(),
                child:
                    Container(height: MediaQuery.of(context).size.height / 2))),
        GridView.count(
            childAspectRatio: 1.0,
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            children: washShopStatus.map((status) {
              return GestureDetector(
                  onTap: () {},
                  child: Stack(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 8, right: 8, bottom: 10),
                        child: Container(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 54, left: 16, right: 16, bottom: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(status,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              letterSpacing: 0.2,
                                              color: Colors.black)),
                                      Expanded(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text('00',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 25,
                                                            letterSpacing: 0.2,
                                                            color:
                                                                Colors.black45))
                                                  ])))
                                    ])),
                            decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color:
                                          HexColor("#738AE6").withOpacity(0.6),
                                      blurRadius: 0.0),
                                ],
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight))))
                  ]));
            }).toList())
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(titleDashboard,
                  style: TextStyle(fontSize: 20.0, color: Colors.black))
            ])),
        body: _bodyData());
  }
}
