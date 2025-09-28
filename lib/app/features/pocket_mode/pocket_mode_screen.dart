import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

class PocketModeScreen extends StatefulWidget {
  const PocketModeScreen({super.key});

  @override
  State<PocketModeScreen> createState() => _PocketModeScreenState();
}

class _PocketModeScreenState extends State<PocketModeScreen> {
  AccelerometerEvent? _accelerometerEvent;
  GyroscopeEvent? _gyroscopeEvent;
  StreamSubscription<dynamic>? _accelerometerSubscription;
  StreamSubscription<dynamic>? _gyroscopeSubscription;
  String _postureStatus = 'Good Posture';
  Timer? _postureTimer;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerEvent = event;
        _detectBadPosture();
      });
    });
    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeEvent = event;
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
    _postureTimer?.cancel();
    super.dispose();
  }

  void _detectBadPosture() {
    if (_accelerometerEvent == null) return;

    // Simple posture detection logic (example)
    // Leaning forward: high Z-axis values
    if (_accelerometerEvent!.z > 8.0) {
      _startPostureTimer('You’ve been leaning forward for 10 mins. Sit upright.');
    } else {
      _resetPostureTimer();
    }
  }

  void _startPostureTimer(String message) {
    if (_postureTimer == null || !_postureTimer!.isActive) {
      _postureTimer = Timer(const Duration(minutes: 10), () {
        setState(() {
          _postureStatus = message;
        });
      });
    }
  }

  void _resetPostureTimer() {
    if (_postureTimer != null && _postureTimer!.isActive) {
      _postureTimer!.cancel();
    }
    setState(() {
      _postureStatus = 'Good Posture';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pocket Mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Posture Status:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              _postureStatus,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _postureStatus == 'Good Posture' ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text('Accelerometer: ${_accelerometerEvent?.x.toStringAsFixed(2)}, ${_accelerometerEvent?.y.toStringAsFixed(2)}, ${_accelerometerEvent?.z.toStringAsFixed(2)}'),
            Text('Gyroscope: ${_gyroscopeEvent?.x.toStringAsFixed(2)}, ${_gyroscopeEvent?.y.toStringAsFixed(2)}, ${_gyroscopeEvent?.z.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}