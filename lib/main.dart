import 'package:contact/screens/home/data_input_screen.dart';
import 'package:contact/screens/home/home_screen.dart';
import 'package:contact/utiles/app_theme.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTeme,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        DataInputScreen.routName: (context) => const DataInputScreen(),
      },
    );
  }
}
