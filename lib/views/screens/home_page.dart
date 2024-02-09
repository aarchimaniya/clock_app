import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool digitalSwitch = false;
  bool analogSwitch = false;
  bool strapSwitch = false;

  DateTime datetime = DateTime.now();

  int hour = 0;
  int minute = 0;
  int second = 0;

  List month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nev",
    "Des",
  ];

  List weekday = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        hour = DateTime.now().hour % 12;
        minute = DateTime.now().minute;
        second = DateTime.now().second;
        print("$hour : $minute : $second");
      });
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TextScaler textScaler = MediaQuery.of(context).textScaler;
    double h = size.height;
    double w = size.width;
    return Container(
      width: 365,
      height: 730,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.lightBlue.shade300, Colors.black54],
        ),
      ),
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Aarchi Maniya"),
                accountEmail: Text("aarchimaniya@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  foregroundImage: AssetImage(
                    "assets/images/my_profile.jpg",
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "01",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                title: Text(
                  "Digital Clock",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("Clock"),
                trailing: Theme(
                  data: ThemeData(
                    useMaterial3: true,
                  ),
                  child: Switch(
                    onChanged: (val) {
                      setState(() {
                        digitalSwitch = val;
                      });
                    },
                    value: digitalSwitch,
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "02",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                title: Text(
                  "Analog Clock",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("Clock"),
                trailing: Theme(
                  data: ThemeData(
                    useMaterial3: true,
                  ),
                  child: Switch(
                    onChanged: (val) {
                      setState(() {
                        analogSwitch = val;
                      });
                    },
                    value: analogSwitch,
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "03",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                title: Text(
                  "Strap Watch",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("Clock"),
                trailing: Theme(
                  data: ThemeData(
                    useMaterial3: true,
                  ),
                  child: Switch(
                    onChanged: (val) {
                      setState(() {
                        strapSwitch = val;
                      });
                    },
                    value: strapSwitch,
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: (!digitalSwitch) ? Colors.black : Colors.white,
          ),
          title: const Text(
            "Clock App",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 30,
            ),
          ),
          backgroundColor: const Color(00000000),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: (!digitalSwitch && !analogSwitch && !strapSwitch)
                ? Image.asset("assets/images/clock1.png")
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        visible: digitalSwitch,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: h * 0.2,
                              width: w * 0.90,
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Color(0x0000000),
                                  boxShadow: [
                                    BoxShadow(
                                        //spreadRadius: 8,
                                        //blurRadius: 22,
                                        //offset: Offset(10, -9),
                                        // color: Colors.purpleAccent.withOpacity(1),
                                        ),
                                    BoxShadow(
                                        // spreadRadius: 8,
                                        //blurRadius: 22,
                                        //offset: Offset(-10, 9),
                                        // color: Colors.blueAccent.withOpacity(1),
                                        )
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GradientText(
                                          hour.toString().padLeft(2, '0'),
                                          style: TextStyle(
                                            fontSize: 55,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          gradientDirection:
                                              GradientDirection.ltr,
                                          colors: [
                                            Colors.blueAccent,
                                            Colors.white,
                                          ],
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                          ),
                                        ),
                                        GradientText(
                                          minute.toString().padLeft(2, '0'),
                                          style: TextStyle(
                                            fontSize: 55,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          gradientDirection:
                                              GradientDirection.ltr,
                                          colors: [
                                            Colors.blueAccent,
                                            Colors.white,
                                          ],
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            GradientText(
                                              second.toString().padLeft(2, '0'),
                                              style: TextStyle(
                                                fontSize: 40,
                                              ),
                                              gradientDirection:
                                                  GradientDirection.ltr,
                                              colors: [
                                                Colors.blue.shade700,
                                                Colors.white,
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  GradientText(
                                    "${month[datetime.month - 1]},${weekday[datetime.weekday - 1]} ${datetime.day.toString().padLeft(2, '0')}",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                    gradientDirection: GradientDirection.ttb,
                                    colors: [
                                      Colors.white,
                                      Colors.blueAccent,
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /*

                      // Dividers
                      ...List.generate(
                        60,
                        (index) => Visibility(
                          visible: analogSwitch,
                          child: Transform.rotate(
                            angle: (index * (pi * 2)) / 60,
                            child: Divider(
                              color: (index % 5 == 0)
                                  ? Colors.black
                                  : (!digitalSwitch)
                                      ? Colors.black
                                      : Colors.white,
                              thickness: (index % 5 == 0) ? 10 : 2,
                              endIndent: (index % 5 == 0) ? w * 0.88 : w * 0.89,
                            ),
                          ),
                        ),
                      ),
                       */

                      Visibility(
                        visible: analogSwitch,
                        child: CircleAvatar(
                          radius: h * 0.2,
                          foregroundImage:
                              AssetImage("assets/images/count_clock.jpg"),
                        ),
                      ),
                      // Second
                      Visibility(
                        visible: analogSwitch,
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Transform.rotate(
                            angle: (second * (pi * 2)) / 60,
                            child: Divider(
                              color: Colors.blue,
                              thickness: 5,
                              indent: w * 0.088,
                              endIndent: w * 0.41,
                            ),
                          ),
                        ),
                      ),
                      // minute
                      Visibility(
                        visible: analogSwitch,
                        child: Transform.rotate(
                          angle: (minute * (pi * 2)) / 60 + pi / 2,
                          child: Divider(
                            color: Colors.black54,
                            thickness: 6,
                            indent: w * 0.18,
                            endIndent: w * 0.45,
                          ),
                        ),
                      ),
                      // hour
                      Visibility(
                        visible: analogSwitch,
                        child: Transform.rotate(
                          angle: ((hour + minute / 60) * (pi * 2)) / 12,
                          child: Divider(
                            color: Colors.brown,
                            thickness: 7,
                            indent: w * 0.20,
                            endIndent: w * 0.45,
                          ),
                        ),
                      ),
                      // dot
                      Visibility(
                        visible: analogSwitch,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: w * 0.02,
                        ),
                      ),
                      // Strap clock

                      // second
                      Visibility(
                          visible: strapSwitch,
                          child: Transform.scale(
                            scale: 8,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.blueAccent.shade100,
                              value: second / 60,
                            ),
                          )),

                      Visibility(
                        visible: strapSwitch,
                        child: Transform.scale(
                          scale: 6,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.2,
                            color: Colors.black38,
                            value: minute / 60,
                          ),
                        ),
                      ),

                      Visibility(
                        visible: strapSwitch,
                        child: Transform.scale(
                          scale: 5,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                            color: Colors.brown,
                            value: (hour + minute / 60) / 12,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        backgroundColor: const Color(0xfffffff),
      ),
    );
  }
}
