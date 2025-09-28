import 'package:flutter/material.dart';
import 'widgets/overview_tab.dart';
import 'widgets/workload_tab.dart';
import 'widgets/alerts_tab.dart';
import 'widgets/reports_tab.dart';

class InstitutionDashboardScreen extends StatefulWidget {
  const InstitutionDashboardScreen({super.key});

  @override
  State<InstitutionDashboardScreen> createState() => _InstitutionDashboardScreenState();
}

class _InstitutionDashboardScreenState extends State<InstitutionDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institution Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Workload'),
            Tab(text: 'Alerts'),
            Tab(text: 'Reports'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OverviewTab(),
          WorkloadTab(),
          AlertsTab(),
          ReportsTab(),
        ],
      ),
    );
  }
}