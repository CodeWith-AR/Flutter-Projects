import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'modules/cart/pages/cart_page.dart';
import 'modules/cart/viewmodels/cart_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        title: 'Cart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF Pro Display',
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        ),
        home: const CartPage(),
      ),
    );
  }
}