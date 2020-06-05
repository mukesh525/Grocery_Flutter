import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

typedef void CountButtonClickCallBack(int count);

class GroceryView extends StatefulWidget {
  final int initialCount;
  final CountButtonClickCallBack onChange;

  GroceryView({this.initialCount, this.onChange});

  @override
  createState() => _GroceryState();
}

class _GroceryState extends State<GroceryView> {
  int count;
  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateCount(int addValue) {
    if (count + addValue >= 1) {
      setState(() {
        count += addValue;
      });
      if (widget.onChange != null) {
        widget.onChange(count);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 35.0,
      child:  Container(
          decoration: BoxDecoration(
              color: Color(0xddFFFFFF),
              border: Border.all(color: Colors.deepOrange, width: 0.5),
              borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    updateCount(-1);
                  },
                  child: Container(
                      width: 40.0,
                      child: Icon(LineIcons.minus, size: 15, color: Colors.deepOrange))),
              Container(
                child: Center(
                    child: Text(
                  '$count',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                )),
              ),
              GestureDetector(
                  onTap: () {
                    updateCount(1);
                  },
                  child: Container(
                      width: 40.0,
                      child: Icon(LineIcons.plus, size: 15, color: Colors.deepOrange))),
            ],
          ),
        )
    );
  }
}
