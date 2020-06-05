import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/home/home_bloc.dart';
import 'package:grocery/bloc/home/home_state.dart';
import 'package:grocery/utils/vars.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeBloc _homeBloc;
  final controller = PageController(viewportFraction: 1);

  @override
  void initState() {
    super.initState();

    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.slider();
  }

  _bodyData() => BlocBuilder(
      bloc: _homeBloc,
      builder: (context, HomeState snapshot) =>
          _sliderList(snapshot.sliderList));

  _sliderList(List<String> sliderList) => ListView(children: <Widget>[
        SizedBox(
            height: 200,
            child: PageView(
                controller: controller,
                children: List.generate(
                    sliderList.length,
                    (int index) => Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: Container(
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1)),
                            child: Image.asset(sliderPath +
                                sliderList[index] +
                                extentionPng)))))),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(homeDescription))
      ]);

  @override
  Widget build(BuildContext context) {
    return _bodyData();
  }
}
