import 'package:flutter/material.dart';

import '../database/app_database.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>{
  late AppDatabase _database;

  @override void initState() {
    super.initState();
    _database = AppDatabase();
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: const Text('My Ecosystem'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildWidget("Calendar"),
            SizedBox( height: 16),
            _buildWidget("To-Do List"),
          ],
        ),
      ),
    );
  }

  Widget _buildWidget(String title) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(title),
    );
  }
}