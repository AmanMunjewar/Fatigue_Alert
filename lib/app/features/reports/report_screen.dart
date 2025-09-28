import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily/Weekly Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fatigue Score Over Time',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: LineChart(
                _buildLineChartData(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Insights',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            const Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: InsightCard(
                      title: 'Most Fatigued',
                      value: 'Afternoon',
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InsightCard(
                      title: 'Best Energy',
                      value: 'Morning',
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData _buildLineChartData() {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 30),
            FlSpot(1, 45),
            FlSpot(2, 60),
            FlSpot(3, 80),
            FlSpot(4, 50),
            FlSpot(5, 70),
            FlSpot(6, 40),
          ],
          isCurved: true,
          color: Colors.teal,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.teal.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}

class InsightCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const InsightCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}