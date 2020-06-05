import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/changepassword/change_password_bloc.dart';
import 'package:grocery/bloc/changepassword/change_password_state.dart';
import 'package:grocery/utils/vars.dart';
import 'package:grocery/utils/extensions.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _newPasswordController =
      new TextEditingController();
  final TextEditingController _newConfirmPasswordController =
      new TextEditingController();
  final TextEditingController _currentPasswordController =
      new TextEditingController();

  bool _validate = false;
  bool visible = true;

  ChangePasswordBloc _changePasswordBloc;

  @override
  void initState() {
    super.initState();

    _changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: appBarComponent(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(titleChangePassword,
                  style: TextStyle(fontSize: 20.0, color: Colors.black))
            ])),
        body: new Form(key: _key, autovalidate: _validate, child: loginBody()));
  }

  loginBody() =>
      ListView(physics: BouncingScrollPhysics(), children: <Widget>[formUI()]);

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    _changePasswordBloc.close();

    _newPasswordController.dispose();
    _newConfirmPasswordController.dispose();
    _currentPasswordController.dispose();
  }

  formUI() => Column(children: <Widget>[
        SizedBox(height: 20.0),
        _showNewPasswordInput(),
        _showNewConfirmPasswordInput(),
        _currentPasswordInput(),
        SizedBox(height: 20.0),
        _showSignUpPressIcon(),
        SizedBox(height: 20.0)
      ]);

  _showNewPasswordInput() => BlocBuilder(
      bloc: _changePasswordBloc,
      builder: (BuildContext context, ChangePasswordState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: widget.inputField(_newPasswordController,
              labelText: inputHintNewPassword,
              hintText: inputHintNewPassword,
              obscureText: visible,
              onChanged: _changePasswordBloc.newPasswordInput,
              validation: validateNewPassword,
              maxLength: 10,
              inkWell: InkWell(
                  child:
                      Icon(visible ? Icons.visibility_off : Icons.visibility),
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  }))));

  _showNewConfirmPasswordInput() => BlocBuilder(
      bloc: _changePasswordBloc,
      builder: (BuildContext context, ChangePasswordState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: widget.inputField(_newConfirmPasswordController,
              labelText: inputHintNewConfirmPassword,
              onChanged: _changePasswordBloc.newConfirmPasswordInput,
              hintText: inputHintNewConfirmPassword,
              maxLength: 10,
              obscureText: visible, validation: (confirmation) {
            return confirmation.isEmpty
                ? 'New confirm password is required'
                : validationEqual(confirmation, _newPasswordController.text)
                    ? null
                    : 'New Password and new confirm password not match';
          },
              inkWell: InkWell(
                  child:
                      Icon(visible ? Icons.visibility_off : Icons.visibility),
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  }))));

  _currentPasswordInput() => BlocBuilder(
      bloc: _changePasswordBloc,
      builder: (BuildContext context, ChangePasswordState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: widget.inputField(_newPasswordController,
              labelText: inputHintCurrentPassword,
              hintText: inputHintCurrentPassword,
              obscureText: visible,
              onChanged: _changePasswordBloc.currentPasswordInput,
              validation: validateCurrentPassword,
              maxLength: 10,
              inkWell: InkWell(
                  child:
                      Icon(visible ? Icons.visibility_off : Icons.visibility),
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  }))));

  _showSignUpPressIcon() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () => _changePasswordValidate());

  _changePasswordValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      Navigator.of(context).pop();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
