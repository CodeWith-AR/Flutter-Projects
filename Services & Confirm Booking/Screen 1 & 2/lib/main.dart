import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_colors.dart';
import 'modules/confirm_booking/pages/confirm_booking_page.dart';
import 'modules/confirm_booking/viewmodels/confirm_booking_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConfirmBookingViewModel()),
      ],
      child: MaterialApp(
        title: 'Confirm Booking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF Pro Display',
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.scaffold,
        ),
        home: const ConfirmBookingPage(),
      ),
    );
  }
}
