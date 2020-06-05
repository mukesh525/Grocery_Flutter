import 'package:flutter/material.dart';
import 'package:grocery/ui/cliper/arc_clipper.dart';
import 'package:grocery/utils/vars.dart';

class LoginBackground extends StatelessWidget {
  final showIcon;
  final image;

  LoginBackground({this.showIcon = true, this.image});

  topHalf(BuildContext context) => Flexible(
      flex: 2,
      child: ClipPath(
          clipper: ArcClipper(),
          child: Stack(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
              colors: gradientsClipper,
            ))),
            showIcon
                ? Center(
                    child: Text(appName,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: quickFont,
                            color: Colors.black45)))
                : Container()
          ])));

  final bottomHalf = Flexible(flex: 3, child: Container());

  @override
  Widget build(BuildContext context) =>
      Column(children: <Widget>[topHalf(context), bottomHalf]);
}
