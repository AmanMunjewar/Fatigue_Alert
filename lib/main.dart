import 'package:flutter/material.dart';
import 'app/features/home/home_screen.dart';

void main() {
  runApp(const TeacherApp());
}

class TeacherApp extends StatelessWidget {
  const TeacherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Fatigue App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFE0F2F1), // Soft mint green
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: const Color(0xFF4DB6AC), // Teal
          primary: const Color(0xFF00796B), // Darker Teal
          surface: Colors.white,
          onSurface: Colors.black87,
          background: const Color(0xFFE0F2F1),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Color(0xFF004D40)),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Color(0xFF00796B)),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black87),
        ),
        cardTheme: CardThemeData(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF00796B),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}