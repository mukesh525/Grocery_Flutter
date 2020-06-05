import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/user/user_bloc.dart';
import 'package:grocery/ui/widget/common_scaffold.dart';
import 'package:grocery/ui/widget/login_background.dart';
import 'package:grocery/utils/vars.dart';
import 'home_page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Duration five;
  Timer t2;
  String routeName;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();

    //TODO change timer screen duration
    five = const Duration(seconds: 3);
    t2 = new Timer(five, () => _loginGo());
  }

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    t2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: <Widget>[LoginBackground(showIcon: true), Image.asset(appIconImage, scale: 4)]),

        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[Text('07-Feb-2020')]));
  }

  _loginGo() => _userBloc.state.isLogin == true
      ? Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  CommonScaffold(selectedNavIndex: 0, tabBody: HomePage())))
      : Navigator.pushReplacementNamed(context, loginRoute);
}
