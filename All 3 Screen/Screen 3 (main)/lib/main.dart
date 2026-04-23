import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'modules/massage/pages/massage_page.dart';
import 'modules/massage/viewmodels/massage_viewmodel.dart';
import 'data/repositories/massage_repository.dart';

// Dummy implementation of ApiClient
class DummyApiClient implements ApiClient {
  @override
  Future<Map<String, dynamic>> get(String endpoint) async {
    return {
      'data': [
        {
          'id': 'demo_1',
          'provider_name': 'Dr. Aisha Rahman',
          'provider_avatar_url': 'assets/images/provider_aisha.png',
          'image_urls': ['assets/images/Woman.png'],
          'rating': 4.2,
          'review_count': 1200,
          'offers_home_visit': true,
          'offers_at_provider': true,
          'service_title': 'Calming Prenatal Massage',
          'service_description': 'Experience gentle care designed to reduce stress, ease body aches, & support your pregnancy journey.',
          'starting_price': 40,
          'duration_minutes': 60,
          'location': 'Dubai',
          'is_favourited': true,
        }
      ]
    };
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    return {'data': {}};
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  final apiClient = DummyApiClient();
  final repository = MassageRepository(apiClient);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final MassageRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MassageViewModel(repository)),
      ],
      child: MaterialApp(
        title: 'Massage',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF Pro Display',
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: const MassagePage(),
      ),
    );
  }
}
