import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/category/category_bloc.dart';
import 'package:grocery/bloc/user/user_bloc.dart';
import 'package:grocery/bloc/user/user_state.dart';
import 'package:grocery/utils/vars.dart';
import 'package:line_icons/line_icons.dart';

class CommonDrawer extends StatefulWidget {
  @override
  CommonDrawerState createState() => CommonDrawerState();
}

class CommonDrawerState extends State<CommonDrawer> {
  UserBloc _userBloc;
  CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();

    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();
  }

  @override
  Widget build(BuildContext context) => Material(
          child: Stack(children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width - 100,
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              BlocBuilder(
                  bloc: _userBloc,
                  builder: (context, UserState userState) =>
                      UserAccountsDrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          accountName: Row(children: <Widget>[
                            Icon(
                              LineIcons.user,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(width: 3),
                            Text(userState.userName.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.teal))
                          ]),
                          accountEmail: Row(children: <Widget>[
                            Icon(Icons.mail_outline,
                                color: Colors.grey, size: 20),
                            SizedBox(width: 3),
                            Text(userState.email,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.teal))
                          ]),
                          currentAccountPicture: CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              backgroundImage: userState.profilePicture.isEmpty
                                  ? ExactAssetImage(
                                      'assets/images/user_profile.png')
                                  : NetworkImage(userState.profilePicture)))),
              CustomListView(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, dashBoardRoute);
                  },
                  name: drawerDashboard,
                  leading: Icon(LineIcons.dashboard, color: Colors.blue)),
              CustomListView(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, orderHistoryRoute);
                  },
                  name: drawerOrderHistory,
                  leading: Icon(LineIcons.history, color: Colors.orangeAccent)),
              CustomListView(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, changePasswordRoute);
                  },
                  name: drawerChangePassword,
                  leading: Icon(LineIcons.lock, color: Colors.black)),
              CustomListView(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, contactUsRoute);
                  },
                  name: drawerContactUs,
                  leading: Icon(LineIcons.user, color: Colors.blueGrey)),
              Divider(color: Colors.black),
              CustomListView(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _categoryBloc.clearData();

                    _userBloc.saveUserName('');
                    _userBloc.saveUserId('');
                    _userBloc.saveMobile('');
                    _userBloc.saveEmail('');
                    _userBloc.saveProfilePicture('');
                    _userBloc.saveIsLogin(false);

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute, (Route<dynamic> route) => false);
                  },
                  name: drawerLogout,
                  leading: Icon(LineIcons.sign_out, color: Colors.deepOrange)),
              Divider(color: Colors.black)
            ]))
      ]));
}

class CustomListView extends StatelessWidget {
  CustomListView(
      {@required this.onPressed, @required this.name, @required this.leading});

  final GestureTapCallback onPressed;
  final String name;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          name,
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w300,
              fontSize: 16.0),
        ),
        leading: leading,
        onTap: onPressed);
  }
}
