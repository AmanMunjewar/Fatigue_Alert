import 'package:flutter/material.dart';

class ReportsTab extends StatelessWidget {
  const ReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Download Monthly Wellness Report',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for PDF download
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Downloading PDF report...')),
                );
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Download as PDF'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for Excel download
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Downloading Excel report...')),
                );
              },
              icon: const Icon(Icons.table_chart),
              label: const Text('Download as Excel'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}