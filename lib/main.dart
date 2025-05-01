import 'package:flutter/material.dart';
import 'package:refocus/settings_screen.dart';
import 'package:refocus/widgets/time_picker.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
  // ignore: library_private_types_in_public_api
  static _MainAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MainAppState>()!;
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.light;
  void changeTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder:
      //     (context, child) => MediaQuery(
      //       data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      //       child: child ?? SizedBox(),
      //     ),
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: themeMode,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            icon: Icon(Icons.settings_outlined),
          ),
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
