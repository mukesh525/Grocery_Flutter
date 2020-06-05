import 'dart:ui';
import 'package:flutter/material.dart';

const String appName = 'Grocery';
const String appUpDateDate = 'Release: 21-11-2019';

const String extentionPng = '.png';
const String sliderPath = 'assets/images/slider_';
const String appIconImage = 'assets/images/app_icon.png';

const String msgNoData = 'No Data';
const int ok200 = 200;
const String apiCode1 = '1';

const String symbolRs = '\u20B9 ';

const String drawerDashboard = 'Dashbaord';
const String drawerOrderHistory = 'Order History';
const String drawerChangePassword = 'Change Password';
const String drawerAboutUs = 'About Us';
const String drawerContactUs = 'Contact Us';
const String drawerLogout = 'Logout';

const String titleWelcome = 'Welcome to';
const String titleSignInContinue = 'Sign in to continue';
const String titleSignUp = 'Sign Up';
const String titleForgotPassword = 'Forgot password';
const String titleChangePassword = 'Change password';
const String titleDashboard = 'Dashboard';
const String deliveryAddress = 'Delivery address';
const String titleOrderHistory = 'Order History';
const String titleOrderHistoryDetail = 'Order history detail';
const String titleContactUs = 'Contact Us';

const String btnCancel = 'CANCEL';
const String btnCheckout = 'Checkout';

const inputHintName = 'Name';
const inputHintMobile = 'Mobile';
const inputHintEmail = 'Email';
const inputHintPassword = 'Password';
const inputHintConfirmPassword = 'Confirm password';
const inputHintAddress = 'Address';
const inputHintNewPassword = 'New password';
const inputHintNewConfirmPassword = 'New confirm password';
const inputHintCurrentPassword = 'Current password';

const labelForgotPassword = 'Forgot Password';
const labelSignUp = "Sign Up";
const labelDoNotAccount = "Dont't have an account?";
const labelCity = 'City';
const labelArea = 'Area';
const labelWashShop = 'Wash Shop';
const labelForgotPasswordA = "That's ok ....";
const labelForgotPasswordB =
    'Just enter the email address you have used to sign up with us and we will send you a current password!';
const labelForgotPasswordC = "Did someone forget their password?";

//TODO FONT NAME
const String quickFont = 'Quicksand';

const String quickBoldFont = 'quicksand_book.otf';
const String quickNormalFont = 'quicksand_book.otf';
const String quickLightFont = 'quicksand_light.otf';

//TODO ROUTE
const String homeRoute = '/homepage';
const String SplashScreenRoute = '/splash_screen';
const String loginRoute = '/login';
const String signUpRoute = '/signup';
const String forgotPasswordRoute = '/forgot_password';
const String changePasswordRoute = '/change_password';
const String dashBoardRoute = '/dashBoard';
const String deliveryAddressRoute = '/delivery_address';
const String orderHistoryRoute = '/order_history';
const String orderHistoryDetailRoute = '/order_history_detail';
const String contactUsRoute = '/contact';

//PAGE
const String contactUsWebsiteName = 'Website name';
const String contactUsEmail = 'Email';
const String contactUsMobile = 'Mobile';
const String contactUsAddress = 'Address';

const String homeDescription = 'Description';

//TODO COLOR
const Color colorRoundText = Colors.grey;
Color colorRoundTextBg = Colors.grey.withOpacity(0.1);
Color colorIconCall = Colors.orange.shade200;
Color colorIconMap = Colors.blue.shade200;
const Color colorInquiryNo = Colors.lightBlue;
const Color colorDate = Colors.black26;
const Color colorRs = Colors.lightBlue;
const Color colorName = Colors.black;
const Color colorModel = Colors.black45;
const Color colorMobile = Colors.grey;
const Color colorAddress = Colors.black87;
const Color colorReason = Colors.deepOrangeAccent;
const Color colorNoData = Colors.grey;

const Color colorOrderId = Colors.blue;
const Color colorOrderPayAmount = Colors.orange;
const Color colorOrderAmount = Colors.grey;
const Color colorOrderCompleteDateTime = Colors.green;
const Color colorShopAddress = Colors.black45;
const Color colorDeliveryAddress = Colors.teal;
const Color colorOrderCancel = Colors.deepOrange;

const Color colorProgressBar = Colors.black54;
const Color colorTitle = Colors.deepOrange;
const Color colorLink = Colors.black;

List<Color> gradientsClipper = [Colors.deepOrange.shade200, Colors.white60];

List<Color> gradientsButton = [Colors.grey.shade200, Colors.white];

List<Color> gradientsButtonCheckOut = [Colors.deepOrange.shade200, Colors.grey];

List<Color> kitGradients = [
  Colors.white,
  Colors.white,
];

//TODO WIDGET
expandStyle(int flex, Widget child) => Expanded(flex: flex, child: child);

Widget appBarComponent(Widget child) {
  return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
          height: 70,
          padding: EdgeInsets.only(left: 10, right: 10, top: 12),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 0,
                color: Colors.deepOrange.withOpacity(0.1),
                offset: Offset(0, 1))
          ]),
          child: child));
}

//VALIDATION
String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Email is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid email';
  } else {
    return null;
  }
}

String validateMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.replaceAll(" ", "").isEmpty) {
    return 'Mobile is required';
  } else if (value.replaceAll(" ", "").length != 10) {
    return 'Mobile number must 10 digits';
  } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
    return 'Mobile number must be digits';
  }
  return null;
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 4) {
    return 'Password must be at least 4 characters';
  }
  return null;
}

String validateCurrentPassword(String value) {
  if (value.isEmpty) {
    return 'Current password required';
  } else if (value.length < 4) {
    return 'Current password must be at least 4 characters';
  }
  return null;
}

String validateNewPassword(String value) {
  if (value.isEmpty) {
    return 'New password required';
  } else if (value.length < 4) {
    return 'New password must be at least 4 characters';
  }
  return null;
}

String validateEditName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Name must be a-z and A-Z';
  }
  return null;
}

String validateEditMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.replaceAll(" ", "").isEmpty) {
    return null;
  } else if (value.replaceAll(" ", "").length != 10) {
    return 'Mobile number must 10 digits';
  } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
    return 'Mobile number must be digits';
  }
  return null;
}

bool validationEqual(String currentValue, String checkValue) {
  if (currentValue == checkValue) {
    return true;
  } else {
    return false;
  }
}

String validateName(String value) {
  String pattern = r'(^[a-zA-Z]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Name is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Name must be a-z and A-Z';
  }
  return null;
}

String validateAddress(String value) {
  String pattern = r'(^[a-zA-Z0-9-, ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Address is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Address must be text and numeric';
  }
  return null;
}

String validateEditAddress(String value) {
  String pattern = r'(^[a-zA-Z0-9-, ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Address must be text and numeric';
  }
  return null;
}

String validateEmpty(String value) {
  if (value.isEmpty) {
    return 'Why mobile not repair?';
  }
  return null;
}
