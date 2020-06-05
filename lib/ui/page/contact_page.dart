import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/ui/widget/login_background.dart';
import 'package:grocery/utils/vars.dart';

class ContactPage extends StatelessWidget {
  Widget bodyData() => Stack(fit: StackFit.expand, children: <Widget>[
        LoginBackground(
          showIcon: false,
        ),
        ListView.builder(
            //shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, i) {
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                      //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10.0),
                              top: Radius.circular(2.0))),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(appName,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700)),
                                ListTile(
                                    leading: Icon(Icons.web),
                                    title: Text('Website'),
                                    subtitle: Text(contactUsWebsiteName)),
                                ListTile(
                                    leading: Icon(Icons.mail_outline),
                                    title: Text('Email'),
                                    subtitle: Text(contactUsEmail)),
                                ListTile(
                                    leading: Icon(Icons.phone),
                                    title: Text('Mobile'),
                                    subtitle: Text(contactUsMobile)),
                                ListTile(
                                    leading: Icon(Icons.location_on),
                                    title: Text('Address'),
                                    subtitle: Text(contactUsAddress))
                              ]))));
            })
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(titleContactUs,
                  style: TextStyle(fontSize: 20.0, color: Colors.black))
            ])),
        body: bodyData());
  }
}
