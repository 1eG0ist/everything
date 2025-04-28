import 'package:flutter/material.dart';

class ProfilePageLayout extends StatefulWidget {
  const ProfilePageLayout({super.key});

  @override
  State<ProfilePageLayout> createState() => _ProfilePageLayoutState();
}

class _ProfilePageLayoutState extends State<ProfilePageLayout> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      body: Center(
        child: Text("PROFILE PAGE"),
      ),
    );
  }
}
