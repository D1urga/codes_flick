import 'package:flick_analytics/home_page.dart';
import 'package:flick_analytics/landing_page.dart';
import 'package:flick_analytics/login_page.dart';
import 'package:flick_analytics/utils/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  HttpOverrides.global = MyHttpOverrides();
  // runApp(const MyApp());
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarContrastEnforced: false,
              systemStatusBarContrastEnforced: false,
              statusBarColor: Color.fromARGB(255, 136, 108, 192),
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: Color.fromARGB(255, 136, 108, 192),
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: email == null ? const LoginPage() : const SplashScreen()
        // home: const SplashScreen(),
        );
  }));
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var email = prefs.getString("email");
//   print(email);
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: email == null ? const LoginPage() : const HomePage(),
//   ));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 136, 108, 192),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Color.fromARGB(255, 136, 108, 192),
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      home: const MyHomePage(
        title: 'my home page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
