import 'package:flutter/material.dart';
import 'data_page.dart';
import 'profile_page.dart';
import 'home_page.dart';

void main() {
  runApp(CompanyProfileApp());
}

class CompanyProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Company Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/data': (context) => DataPage(),
      },
    );
  }
}
