import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/home/pages/home_page.dart';
import 'modules/home/viewmodels/home_view_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Street Clothes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF Pro Display',
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        ),
        home: const HomePage(),
      ),
    );
  }
}