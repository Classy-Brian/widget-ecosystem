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
            StreamBuilder<List<CalendarEvent>>(
                stream: calendarStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return _buildWidget("Calendar (Error!)");
                  }

                  if (!snapshot.hasData) {
                    return _buildWidget("Calendar (loading...)");
                  }

                  final events = snapshot.data!;
                  return _buildWidget("Calendar (${events.length} events)");
                }
            ),
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

  Stream<List<CalendarEvent>> get calendarStream {
    return _database.select(_database.calendarEvents).watch();
  }
}