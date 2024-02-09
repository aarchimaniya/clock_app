import 'package:clock_app/utilies/routes.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/views/screens/home_page.dart';

void main() {
  runApp(
    const ClockApp(),
  );
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      Routes.home_page: (context) => const HomePage(),
    });
  }
}
