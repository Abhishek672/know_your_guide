import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const KnowYourGuideApp());
}

class KnowYourGuideApp extends StatelessWidget {
  const KnowYourGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Know Your Guide',
      debugShowCheckedModeBanner: false, // Hides the "DEBUG" banner
      
      // We apply our custom theme globally here.
      // Now, any widget we create will automatically use these colors and fonts.
      theme: AppTheme.lightTheme,
      
      // Set the initial screen of the app
      home: const HomeScreen(),
    );
  }
}
