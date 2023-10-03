import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flick_analytics/home_page.dart';
import 'package:flick_analytics/landing_page.dart';
import 'package:flick_analytics/utils/text_field_util.dart';
import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isChecked = true;
bool isLoading = true;
TextEditingController cn1 = TextEditingController();
TextEditingController cn2 = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  // void dispose() {
  //   super.dispose();
  //   cn1.dispose();
  //   cn2.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: ProsteBezierCurve(
                position: ClipPosition.top,
                list: [
                  BezierCurveSection(
                    start: Offset(screenWidth, 270),
                    top: Offset(screenWidth / 2, 340),
                    end: const Offset(0, 270),
                  ),
                ],
              ),
              child: Container(
                height: screenHeight,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromARGB(255, 136, 108, 192),
                      Color.fromARGB(255, 4, 30, 68)
                    ])),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Container(
                  height: 42.h,
                  width: 87.w,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(36)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(150, 0, 0, 0), blurRadius: 8)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFieldUtil(
                          hintText: 'Username',
                          color: Colors.black,
                          showIcon: false,
                          readonly: false,
                          maxline: 1,
                          borderradius: 36,
                          fieldWidth: 69.w,
                          textSize: 17,
                          cont: cn1,
                          conPadding: 15,
                          borderwidth: 1),
                      TextFieldUtil(
                          hintText: 'Password',
                          readonly: false,
                          color: Colors.black,
                          showIcon: false,
                          maxline: 1,
                          borderradius: 36,
                          fieldWidth: 69.w,
                          textSize: 17,
                          cont: cn2,
                          conPadding: 15,
                          borderwidth: 1),
                      SizedBox(
                          width: 70.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 136, 108, 192),
                                  radius: 10,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 8,
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor: isChecked
                                          ? const Color.fromARGB(
                                              255, 136, 108, 192)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 136, 108, 192),
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'Forget Password?',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 4, 30, 68),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                      InkWell(
                        onTap: () {
                          signIn();

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                        },
                        child: Container(
                          height: 6.h,
                          width: 69.w,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 136, 108, 192),
                            borderRadius: BorderRadius.all(Radius.circular(36)),
                          ),
                          child: Center(
                              child: isLoading
                                  ? const Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : const SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 5,
                                        ),
                                      ),
                                    )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
                top: 50, left: 50, right: 50, child: FlickImageAsset()),
          ],
        ),
      ),
    );
  }

  Future<Response?> signIn() async {
    var dio = Dio();
    try {
      setState(() {
        isLoading = false;
      });
      var response = await dio.post(
        'https://api.flickanalytics.in/FlickReportsAPIs/login.php',
        data: {"username": cn1.text, "password": cn2.text},
      );
      print(response.data['success']);

      print(response.statusCode);
      if (response.data['success'] == true) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("email", cn1.text);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
      setState(() {
        isLoading = true;
      });
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

class FlickImageAsset extends StatelessWidget {
  const FlickImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/logo_flick_analytics.png');
    Image image = Image(image: assetImage);
    return SizedBox(
      height: 60,
      width: 222,
      child: image,
    );
  }
}
