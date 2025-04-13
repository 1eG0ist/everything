import 'package:everything/di/service_locator.dart';
import 'package:everything/ui/pages/home_page/ui/home_page_layout.dart';
import 'package:everything/ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализируем зависимости
  await setupDependencies();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Everything',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePageLayout(),
    );
  }
}