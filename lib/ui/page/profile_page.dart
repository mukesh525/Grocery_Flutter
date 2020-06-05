import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/user/user_bloc.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatefulWidget {
  @override
  createState() => ProfileState();
}

class ProfileState extends State<ProfilePage> {
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Center(
          child: Container(
              margin: EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.2),
                backgroundImage:
                    new ExactAssetImage('assets/images/user_profile.png'),
                radius: 50.0,
              ))),
      ListTile(
          leading: Icon(LineIcons.user),
          title: Text('Name'),
          subtitle: Text(_userBloc.state.userName)),
      ListTile(
          leading: Icon(LineIcons.mobile),
          title: Text('Mobile'),
          subtitle: Text(_userBloc.state.mobile)),
      ListTile(
          leading: Icon(Icons.alternate_email),
          title: Text('Email'),
          subtitle: Text(_userBloc.state.email)),
      ListTile(
          leading: Icon(LineIcons.location_arrow),
          title: Text('Address'),
          subtitle: Text(_userBloc.state.address))
    ]);
  }
}
