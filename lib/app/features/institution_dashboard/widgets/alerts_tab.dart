import 'package:flutter/material.dart';

class AlertsTab extends StatelessWidget {
  const AlertsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildAlertItem(
          context,
          teacherName: 'John Doe',
          fatigueScore: 85,
          days: 3,
        ),
        _buildAlertItem(
          context,
          teacherName: 'Jane Smith',
          fatigueScore: 92,
          days: 5,
        ),
        _buildAlertItem(
          context,
          teacherName: 'Peter Jones',
          fatigueScore: 88,
          days: 4,
        ),
      ],
    );
  }

  Widget _buildAlertItem({
    required BuildContext context,
    required String teacherName,
    required int fatigueScore,
    required int days,
  }) {
    return Card(
      color: Colors.red.shade100,
      child: ListTile(
        leading: const Icon(Icons.warning, color: Colors.red),
        title: Text(
          teacherName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Fatigue score: $fatigueScore (consistently for $days days)'),
        trailing: ElevatedButton(
          onPressed: () {
            // Action to offer support
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Offer Support'),
        ),
      ),
    );
  }
}