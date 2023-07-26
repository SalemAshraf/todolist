// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'SettingsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Plus Jakartas Sans',
              fontSize: 20),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 48,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Mohammad Ahmadian',
                      style: TextStyle(
                          fontSize: 24, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'We’re cool. Get to know us 🎉',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Medium'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(0, 0, 168, 106)),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Color(0xFF00A86B)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF00A86B)),
                        ),
                        onPressed: () {},
                        child: Text('Edit profile',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Plus Jakarta Sans'))),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Account',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Plus Jakarta Medium',
                                    color: Color(0xff7E8491)),
                              ),
                              Divider(
                                height: 12,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/lock.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Change password',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 5, 5, 5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/crown.png'),
                                    color: Color(0xFFF4AF25),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Go Premium!',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color(0xFFF4AF25)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'More',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Plus Jakarta Medium',
                                    color: Color(0xff7E8491)),
                              ),
                              Divider(
                                height: 12,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/brush.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Theme',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 5, 5, 5)),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/messages-3.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Feedback',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/24-support.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Support',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 5, 5, 5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/star.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Rate',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/shield-tick.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Privacy policy',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/clipboard-text.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Terms of use',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/info-circle.png'),
                                    color: Color(0xff7E8491),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'About us',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/settings/logout.png'),
                                    color: Color(0xffF44725),
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color(0xFFF44725)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              /////////////////////////////
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Version',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color(0xff7E8491)),
                                  ),
                                  Text(
                                    '1.4.2',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Plus Jakarta Medium',
                                        color: Color(0xff7E8491)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
