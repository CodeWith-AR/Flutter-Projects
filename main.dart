import 'package:flutter/material.dart';
import 'weather_service.dart';
import 'weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController controller = TextEditingController();

  Weather? weather;
  bool isLoading = false;
  String error = "";

  void getWeather() async {
    setState(() {
      isLoading = true;
      error = "";
      weather = null;
    });

    try {
      final data =
          await WeatherService().fetchWeather(controller.text.trim());

      setState(() {
        weather = data;
      });
    } catch (e) {
      setState(() {
        error = "City not found or network issue!";
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  IconData getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case "clouds":
        return Icons.cloud;
      case "rain":
        return Icons.water_drop;
      case "clear":
        return Icons.wb_sunny;
      default:
        return Icons.wb_cloudy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Enter City",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: getWeather,
              child: Text("Get Weather"),
            ),

            SizedBox(height: 20),

            // 🔄 LOADING
            if (isLoading) CircularProgressIndicator(),

            // ❌ ERROR
            if (error.isNotEmpty)
              Text(error, style: TextStyle(color: Colors.red)),

            // ✅ WEATHER DATA
            if (weather != null)
              Column(
                children: [
                  Text(
                    weather!.cityName,
                    style: TextStyle(fontSize: 24),
                  ),

                  SizedBox(height: 10),

                  Icon(
                    getWeatherIcon(weather!.condition),
                    size: 80,
                  ),

                  SizedBox(height: 10),

                  Text(
                    "${weather!.temperature}°C",
                    style: TextStyle(fontSize: 30),
                  ),

                  Text(weather!.condition),
                ],
              ),
          ],
        ),
      ),
    );
  }
}