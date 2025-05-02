import 'package:flutter/material.dart';
import 'package:refocus/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool isDark;
  bool playSound = false;
  @override
  void initState() {
    isDark = MainApp.of(context).themeMode == ThemeMode.dark;
    super.initState();
  }

  void handleDarkModeChange(bool value) {
    setState(() {
      isDark = value;
      MainApp.of(context).changeTheme(value ? ThemeMode.dark : ThemeMode.light);
    });
  }

  void handlePlaySoundChange(bool value) {
    setState(() {
      playSound = value;
    });
  }

  void showSoundChangeDialog() {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 3 / 4,
                maxWidth: MediaQuery.of(context).size.width - 86,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Text("Select Sound", style: TextStyle(fontSize: 24)),
                  ),
                  Divider(),
                  ListView(
                    shrinkWrap: true,
                    children:
                        topPopularSounds
                            .map(
                              (name) =>
                                  ListTile(title: Text(name), onTap: () {}),
                            )
                            .toList(),
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 24, 24, 24),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Done"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: topPopularSounds.length,
            //   itemBuilder:
            //       (context, index) =>
            //           ListTile(title: Text(topPopularSounds[index])),
            // ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: const Text("Settings")),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: const Text("Dark Theme", style: TextStyle(fontSize: 18)),
              value: isDark,
              onChanged: handleDarkModeChange,
            ),
          ),
          SliverToBoxAdapter(
            child: SwitchListTile(
              title: const Text("Play sound", style: TextStyle(fontSize: 18)),
              value: playSound,
              onChanged: handlePlaySoundChange,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: const Text("Select Sound"),
              onTap: showSoundChangeDialog,
              enabled: playSound,
            ),
          ),
        ],
      ),
    );
  }
}

List<String> topPopularSounds = [
  "Note",
  "Tri-tone",
  "Signal",
  "Chime",
  "Over the Horizon",
  "Default",
  "Reflection",
];
