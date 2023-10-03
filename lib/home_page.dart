import 'package:flick_analytics/budgeting_page.dart';
import 'package:flick_analytics/landing_page.dart';
// import 'package:flick_analytics/property_logs.dart';
// import 'package:flick_analytics/transaction.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'login_page.dart';
import 'sitelogs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List homePageWidgets = [
    const LandingPage(),
    // const Transaction(),
    const Scaffold(backgroundColor: Color.fromARGB(255, 136, 108, 192)),
    const BudgetingPage(),
    const Scaffold(backgroundColor: Color.fromARGB(255, 136, 108, 192)),
    const Sitelogs(),
    const Scaffold(backgroundColor: Color.fromARGB(255, 136, 108, 192)),
  ];

  int page = 0;
  List isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, right: 4, bottom: 8, left: 15),
              child: Column(
                children: [
                  Divider(
                    color: Colors.white,
                    thickness: 5,
                    height: 14,
                    endIndent: 2,
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 6,
                    height: 6,
                    endIndent: 2,
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 5,
                    height: 15,
                    endIndent: 10,
                  )
                ],
              ),
            ),
          ),
          actions: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: Container(
                margin: const EdgeInsets.all(7),
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 4, 30, 68),
                      width: 2,
                    )),
                child: const Center(
                  child: Text(
                    'EX',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        drawer: SizedBox(
          width: 280,
          child: Drawer(
              child: Column(
            children: [
              const SizedBox(
                height: 85,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      '➜',
                      style: TextStyle(
                          color: Color.fromARGB(255, 150, 160, 175),
                          fontSize: 27),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 39, width: 143, child: FlickImageAsset()),
              const SizedBox(
                height: 60,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    page = 0;
                    isSelected[0] = true;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    isSelected[3] = false;
                    isSelected[4] = false;
                    isSelected[5] = false;
                  });
                },
                contentPadding: const EdgeInsets.only(left: 40),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                selected: isSelected[0],
                selectedTileColor: const Color.fromARGB(255, 243, 240, 249),
                leading: Icon(
                  Icons.house,
                  size: 25,
                  color: isSelected[0]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 150, 160, 175),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: isSelected[0]
                          ? const Color.fromARGB(255, 136, 108, 192)
                          : const Color.fromARGB(255, 150, 160, 175),
                      fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    page = 1;
                    isSelected[0] = false;
                    isSelected[1] = true;
                    isSelected[2] = false;
                    isSelected[3] = false;
                    isSelected[4] = false;
                    isSelected[5] = false;
                  });
                },
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                selected: isSelected[1],
                selectedTileColor: const Color.fromARGB(255, 243, 240, 249),
                contentPadding: const EdgeInsets.only(left: 40),
                leading: Icon(
                  Icons.credit_card,
                  size: 25,
                  color: isSelected[1]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 150, 160, 175),
                ),
                title: Text(
                  'Transactions',
                  style: TextStyle(
                      color: isSelected[1]
                          ? const Color.fromARGB(255, 136, 108, 192)
                          : const Color.fromARGB(255, 150, 160, 175),
                      fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    page = 2;
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = true;
                    isSelected[3] = false;
                    isSelected[4] = false;
                    isSelected[5] = false;
                  });
                },
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                contentPadding: const EdgeInsets.only(left: 40),
                selected: isSelected[2],
                selectedTileColor: const Color.fromARGB(255, 243, 240, 249),
                leading: Icon(
                  Icons.attach_money,
                  size: 25,
                  color: isSelected[2]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 150, 160, 175),
                ),
                title: Text(
                  'Budgeting',
                  style: TextStyle(
                      color: isSelected[2]
                          ? const Color.fromARGB(255, 136, 108, 192)
                          : const Color.fromARGB(255, 150, 160, 175),
                      fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    page = 3;
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    isSelected[3] = true;
                    isSelected[4] = false;
                    isSelected[5] = false;
                  });
                },
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                contentPadding: const EdgeInsets.only(left: 40),
                selected: isSelected[3],
                selectedTileColor: const Color.fromARGB(255, 243, 240, 249),
                leading: Icon(
                  Icons.pie_chart,
                  size: 25,
                  color: isSelected[3]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 150, 160, 175),
                ),
                title: Text(
                  'Reporting',
                  style: TextStyle(
                      color: isSelected[3]
                          ? const Color.fromARGB(255, 136, 108, 192)
                          : const Color.fromARGB(255, 150, 160, 175),
                      fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    page = 4;
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    isSelected[3] = false;
                    isSelected[4] = true;
                    isSelected[5] = false;
                  });
                },
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                contentPadding: const EdgeInsets.only(left: 40),
                selected: isSelected[4],
                selectedTileColor: const Color.fromARGB(255, 243, 240, 249),
                leading: Icon(
                  Icons.list_alt,
                  size: 25,
                  color: isSelected[4]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 150, 160, 175),
                ),
                title: Text(
                  'Sitelogs',
                  style: TextStyle(
                      color: isSelected[4]
                          ? const Color.fromARGB(255, 136, 108, 192)
                          : const Color.fromARGB(255, 150, 160, 175),
                      fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    page = 5;
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    isSelected[3] = false;
                    isSelected[4] = false;
                    isSelected[5] = true;
                  });
                },
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                contentPadding: const EdgeInsets.only(left: 40),
                selected: isSelected[5],
                selectedTileColor: const Color.fromARGB(255, 243, 240, 249),
                leading: Icon(
                  Icons.date_range,
                  size: 25,
                  color: isSelected[5]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 150, 160, 175),
                ),
                title: Text(
                  'Schedules',
                  style: TextStyle(
                      color: isSelected[5]
                          ? const Color.fromARGB(255, 136, 108, 192)
                          : const Color.fromARGB(255, 150, 160, 175),
                      fontSize: 20),
                ),
              ),
            ],
          )),
        ),
        endDrawer: Padding(
          padding: EdgeInsets.only(bottom: 58.h, right: 7.w),
          child: SizedBox(
            width: 133,
            height: 133,
            child: Drawer(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.person_2_outlined,
                        size: 19,
                        color: Color.fromARGB(255, 136, 108, 192),
                      ),
                      Text(
                        ' Profile     ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 107, 107, 107)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.mail_outline,
                        size: 19,
                        color: Color.fromARGB(255, 9, 189, 60),
                      ),
                      Text(
                        ' Inbox      ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 107, 107, 107)),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.remove("email");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return LoginPage();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.logout,
                          size: 19,
                          color: Color.fromARGB(255, 252, 46, 83),
                        ),
                        Text(
                          'Logout   ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 107, 107, 107)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: homePageWidgets[page],
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          barrierColor: const Color.fromARGB(200, 0, 0, 0),
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color.fromARGB(255, 136, 108, 192),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            title: const Text(
              'Exit ?',
              style: TextStyle(
                  color: Color.fromARGB(255, 241, 240, 240),
                  fontWeight: FontWeight.w500),
            ),
            content: const Text(
              'Are you sure you want to exit ?',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 246, 241, 241)),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 20),
                      primary: const Color.fromARGB(
                          255, 237, 240, 237), // Background color
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 20),
                      primary: const Color.fromARGB(
                          255, 255, 249, 249), // Background color
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ) ??
        false;
  }
}
