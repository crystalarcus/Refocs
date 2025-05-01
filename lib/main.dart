import 'package:flutter/material.dart';
import 'package:refocus/widgets/time_picker.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:
          (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? SizedBox(),
          ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Frequency"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
        ],
      ),
      body: Column(
        children: [
          TimePickerWidget(
            initialTime: TimeOfDay.fromDateTime(
              DateTime(2025, 1, 1, 10, 0, 0, 0, 0),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 56,
            width: MediaQuery.sizeOf(context).width - 56,
            child: FilledButton.icon(
              onPressed: () {},
              label: const Text("Start", style: TextStyle(fontSize: 21)),
              icon: Icon(Icons.play_arrow_outlined, size: 32),
            ),
          ),
          SizedBox(height: 36),
        ],
      ),
    );
  }
}
