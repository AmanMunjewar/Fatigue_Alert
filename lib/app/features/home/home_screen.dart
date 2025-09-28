import 'package:flutter/material.dart';
import 'dart:async';
import 'widgets/circular_fatigue_meter.dart';
import 'package:app/app/features/animated_guides/animated_guide_screen.dart';
import 'package:app/app/features/reports/report_screen.dart';
import 'package:app/app/features/pocket_mode/pocket_mode_screen.dart';
import 'package:app/app/features/institution_dashboard/institution_dashboard_screen.dart';
import 'widgets/suggestion_popup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _fatigueScore = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Simulate real-time score updates
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _fatigueScore = (_fatigueScore + 5) % 101;
      });
      _showSuggestionIfNeeded();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _showSuggestionIfNeeded() {
    String? message;
    IconData? icon;
    Color? color;

    if (_fatigueScore > 40 && _fatigueScore <= 45) {
      message = "Drink Water";
      icon = Icons.local_drink;
      color = Colors.blue;
    } else if (_fatigueScore > 70 && _fatigueScore <= 75) {
      message = "Quick 30-sec stretch";
      icon = Icons.accessibility_new;
      color = Colors.orange;
    } else if (_fatigueScore > 90 && _fatigueScore <= 95) {
      message = "Rest voice for 10 mins";
      icon = Icons.mic_off;
      color = Colors.red;
    } else if (_fatigueScore >= 100) {
      message = "Fatigue very high, please rest before next class.";
      icon = Icons.warning;
      color = Colors.red.shade800;
    }

    if (message != null) {
      SuggestionPopup.show(
        context,
        message: message,
        icon: icon!,
        color: color ?? Colors.blue,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Fatigue Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.show_chart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReportScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.animation),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimatedGuideScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.phone_in_talk),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PocketModeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.business),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InstitutionDashboardScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: CircularFatigueMeter(score: _fatigueScore),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Simulate Fatigue Score',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Slider(
                    value: _fatigueScore,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _fatigueScore.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _fatigueScore = value;
                      });
                    },
                    onChangeEnd: (value) {
                      _showSuggestionIfNeeded();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}