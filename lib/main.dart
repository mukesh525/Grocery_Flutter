import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/bloc/category/category_bloc.dart';
import 'package:grocery/bloc/deliveryaddress/delivery_address_bloc.dart';
import 'package:grocery/bloc/signup/sign_up_bloc.dart';
import 'package:grocery/ui/page/home_page.dart';
import 'package:grocery/ui/page/order_history_detail_page.dart';
import 'bloc/changepassword/change_password_bloc.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/orderhistory/order_history_bloc.dart';
import 'bloc/orderhistorydetail/order_history_bloc.dart';
import 'bloc/user/user_bloc.dart';
import 'service/di/dependency_injection.dart';
import 'ui/page/change_password_page.dart';
import 'ui/page/contact_page.dart';
import 'ui/page/dashboard_page.dart';
import 'ui/page/delivery_address.dart';
import 'ui/page/forgot_password_page.dart';
import 'ui/page/login_page.dart';
import 'ui/page/order_history_page.dart';
import 'ui/page/sign_up_page.dart';
import 'ui/page/splash_screen.dart';
import 'utils/vars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.deepOrange,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.deepOrangeAccent,
      statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(dark);

  Injector.configure(Flavor.Testing);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: appName,
      theme: ThemeData(brightness: Brightness.light,
          accentColor: Colors.deepOrange,
          primaryColor: Colors.deepOrangeAccent,
          primarySwatch: Colors.deepOrange,
          fontFamily: quickFont),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      initialRoute: '/',

      //routes
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreenPage(),
        loginRoute: (BuildContext context) => LoginPage(),
        signUpRoute: (BuildContext context) => SignUpPage(),
        forgotPasswordRoute: (BuildContext context) => ForgotPasswordPage(),
        changePasswordRoute: (BuildContext context) => ChangePasswordPage(),
        dashBoardRoute: (BuildContext context) => DashBoardPage(),
        deliveryAddressRoute: (BuildContext context) => DeliveryAddressPage(),
        orderHistoryRoute: (BuildContext context) => OrderHistoryPage(),
        orderHistoryDetailRoute: (BuildContext context) => OrderHistoryDetailPage(),
        contactUsRoute: (BuildContext context) => ContactPage(),

        homeRoute: (BuildContext context) => HomePage()
      });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(),
        child: BlocProvider(create: (context) => LoginBloc(),
        child: BlocProvider(create: (context) => SignUpBloc(),
        child: BlocProvider(create: (context) => ChangePasswordBloc(),
        child: BlocProvider(create: (context) => HomeBloc(),
        child: BlocProvider(create: (context) => CategoryBloc(),
        child: BlocProvider(create: (context) => DeliveryAddressBloc(),
        child: BlocProvider(create: (context) => OrderHistoryBloc(),
        child: BlocProvider(create: (context) => OrderHistoryDetailBloc(),

            child: materialApp)))))))));
  }
}