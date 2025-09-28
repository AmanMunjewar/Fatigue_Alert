import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMetricCard(
            context,
            title: 'Average Fatigue Score',
            value: '68',
            color: Colors.orange,
          ),
          const SizedBox(height: 20),
          _buildPeakTimeCard(context),
          const SizedBox(height: 20),
          _buildComparisonChart(context),
        ],
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, {required String title, required String value, required Color color}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(
              value,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeakTimeCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Peak Fatigue Times', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(label: Text('Afternoons'), backgroundColor: Colors.redAccent),
                Chip(label: Text('Fridays'), backgroundColor: Colors.orangeAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Department-wise Fatigue', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barGroups: [
                    _makeGroupData(0, 75, barColor: Colors.teal),
                    _makeGroupData(1, 60, barColor: Colors.orange),
                    _makeGroupData(2, 50, barColor: Colors.blue),
                    _makeGroupData(3, 85, barColor: Colors.red),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 0:
                              text = const Text('Math', style: style);
                              break;
                            case 1:
                              text = const Text('Science', style: style);
                              break;
                            case 2:
                              text = const Text('English', style: style);
                              break;
                            case 3:
                              text = const Text('History', style: style);
                              break;
                            default:
                              text = const Text('', style: style);
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 16.0,
                            child: text,
                          );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y, {required Color barColor}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: 22,
        ),
      ],
    );
  }
}