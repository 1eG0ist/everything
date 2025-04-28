import 'package:everything/ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPageLayout extends StatefulWidget {
  const SettingsPageLayout({super.key});

  @override
  State<SettingsPageLayout> createState() => _SettingsPageLayoutState();
}

class _SettingsPageLayoutState extends State<SettingsPageLayout> {
  bool isDark = true;

  void setTheme() async {
    isDark = await Provider.of<ThemeProvider>(context, listen: false).getDarkThemePreference();
    setState(() {});
  }

  void changeTheme() async {
    setState(() {
      isDark = Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    });
  }

  @override
  void initState() {
    super.initState();
    setTheme();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Theme"),
                      Switch(
                          value: isDark,
                          activeColor: theme.secondary,
                          inactiveThumbColor: theme.secondary,
                          inactiveTrackColor: theme.surface,
                          onChanged: (bool isDarkTheme) {
                            changeTheme();
                          }
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
