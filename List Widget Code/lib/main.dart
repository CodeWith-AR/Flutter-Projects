import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'basic_list_view.dart';
import 'list_view_builder.dart';
import 'grid_view_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter List Widgets",
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUp(),
        '/basic': (context) => BasicListView(),
        '/builder': (context) => ListViewBuilder(),
        '/grid': (context) => GridViewExample(),
      },
    );
  }
}