import 'package:clean_architecture_practice/config/theme/app_themes.dart';
import 'package:clean_architecture_practice/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture_practice/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture',
      theme: themeData,
      home: const DailyNews(),
    );
  }
}
