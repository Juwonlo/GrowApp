import 'package:flutter/material.dart';
import 'package:registration_sql/Screens/login_page.dart';
import 'package:toast/toast.dart';
//import 'package:path_provider_windows/path_provider_windows.dart';

void main() {
  //PathProviderWindows.registerWith();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
    );
  }
}

