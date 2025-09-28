import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WorkloadTab extends StatelessWidget {
  const WorkloadTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Workload vs. Fatigue Correlation',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ScatterChart(
              ScatterChartData(
                scatterSpots: [
                  _createScatterSpot(2, 40, color: Colors.green),
                  _createScatterSpot(3, 60, color: Colors.yellow),
                  _createScatterSpot(4, 85, color: Colors.orange),
                  _createScatterSpot(5, 95, color: Colors.red),
                  _createScatterSpot(2, 35, color: Colors.green),
                  _createScatterSpot(3, 65, color: Colors.yellow),
                  _createScatterSpot(4, 80, color: Colors.orange),
                  _createScatterSpot(5, 90, color: Colors.red),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Text('${value.toInt()} lectures');
                      },
                      interval: 1,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Text('${value.toInt()} score');
                      },
                      interval: 20,
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey),
                ),
                gridData: const FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Card(
            color: Colors.teal,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Insight: Teachers with 4+ back-to-back lectures show higher fatigue.',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ScatterSpot _createScatterSpot(double x, double y, {required Color color}) {
    return ScatterSpot(
      x,
      y,
      dotPainter: FlDotCirclePainter(
        radius: 8,
        color: color,
      ),
    );
  }
}