import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/deliveryaddress/delivery_address_bloc.dart';
import 'package:grocery/bloc/deliveryaddress/delivery_address_state.dart';
import 'package:grocery/bloc/user/user_bloc.dart';
import 'package:grocery/utils/vars.dart';
import 'package:grocery/utils/extensions.dart';

class DeliveryAddressPage extends StatefulWidget {
  @override
  createState() => _DryWashDeliveryAddressState();
}

class _DryWashDeliveryAddressState extends State<DeliveryAddressPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _validate = false;
  bool visible = true;

  UserBloc _userBloc;
  DeliveryAddressBloc _deliveryAddressBloc;

  @override
  void initState() {
    super.initState();

    _deliveryAddressBloc = BlocProvider.of<DeliveryAddressBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();

    _nameController.text = _userBloc.state.userName;
    _emailController.text = _userBloc.state.email;
    _mobileController.text = _userBloc.state.mobile;
    _addressController.text = _userBloc.state.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(Row(children: <Widget>[
          Text(deliveryAddress,
              style: TextStyle(fontSize: 20.0, color: Colors.black))
        ])),
        body:
            Form(key: _key, autovalidate: _validate, child: profileEditBody()));
  }

  profileEditBody() =>
      ListView(physics: BouncingScrollPhysics(), children: <Widget>[formUI()]);

  @override
  void dispose() {
    if (this.mounted) super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
  }

  formUI() => Column(children: <Widget>[
        _showNameInput(),
        _showEmailInput(),
        _showMobileInput(),
        _showAddressInput(),
        SizedBox(height: 20.0),
        _showSignUpPressIcon(),
        SizedBox(height: 20.0)
      ]);

  _showNameInput() => BlocBuilder(
      bloc: _deliveryAddressBloc,
      builder: (BuildContext context, DeliveryAddressState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: widget.inputField(_nameController,
              labelText: inputHintName,
              hintText: inputHintName,
              onChanged: _deliveryAddressBloc.nameInput,
              validation: validateName,
              keyboardType: TextInputType.text,
              maxLength: 15)));

  _showEmailInput() => BlocBuilder(
      bloc: _deliveryAddressBloc,
      builder: (BuildContext context, DeliveryAddressState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: widget.inputField(_emailController,
              labelText: inputHintEmail,
              hintText: inputHintEmail,
              onChanged: _deliveryAddressBloc.emailInput,
              validation: validateEmail,
              keyboardType: TextInputType.emailAddress)));

  _showMobileInput() => BlocBuilder(
      bloc: _deliveryAddressBloc,
      builder: (BuildContext context, DeliveryAddressState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: widget.inputField(_mobileController,
              labelText: inputHintMobile,
              hintText: inputHintMobile,
              validation: validateMobile,
              onChanged: _deliveryAddressBloc.mobileInput,
              keyboardType: TextInputType.phone,
              maxLength: 10)));

  _showAddressInput() => BlocBuilder(
      bloc: _deliveryAddressBloc,
      builder: (BuildContext context, DeliveryAddressState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: widget.inputField(_addressController,
              labelText: inputHintAddress,
              hintText: inputHintAddress,
              validation: validateAddress,
              onChanged: _deliveryAddressBloc.addressInput,
              keyboardType: TextInputType.text,
              maxLength: 50)));

  _showSignUpPressIcon() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () => _signUpValidate());

  _signUpValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      FocusScope.of(context).requestFocus(FocusNode());
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
