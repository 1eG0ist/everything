import 'package:flutter/material.dart';
import 'package:everything/ui/pages/home_page/ui/home_page_layout.dart';
import 'package:everything/ui/pages/profile_page/ui/profile_page_layout.dart';
import 'package:everything/ui/pages/settings_page/settings_page_layout.dart';

class MenuPageLayout extends StatefulWidget {
  const MenuPageLayout({super.key});

  @override
  State<MenuPageLayout> createState() => _MenuPageLayoutState();
}

class _MenuPageLayoutState extends State<MenuPageLayout> {
  int _currentIndex = 1;
  bool _isVisible = true;
  double _scrollOffset = 0;

  final List<Widget> _screens = [
    const SettingsPageLayout(),
    const HomePageLayout(),
    const ProfilePageLayout(),
  ];

  void _handleNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final currentOffset = notification.metrics.pixels;
      if (currentOffset > _scrollOffset && currentOffset > 50) {
        if (_isVisible) setState(() => _isVisible = false);
      } else if (currentOffset < _scrollOffset || currentOffset <= 0) {
        if (!_isVisible) setState(() => _isVisible = true);
      }
      _scrollOffset = currentOffset;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _handleNotification(notification);
          return false;
        },
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: _isVisible
          ? _buildAnimatedBottomNavBar(theme)
          : null, // Полностью убираем при скрытии
    );
  }

  Widget _buildAnimatedBottomNavBar(ColorScheme theme) {
    return AnimatedSlide(
      offset: _isVisible ? Offset(0, 0) : Offset(0, 1),
      duration: const Duration(milliseconds: 3000),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 3000),
        child: Container(
          decoration: BoxDecoration(
            color: theme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border(
              top: BorderSide(color: theme.outline.withOpacity(0.1)),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            type: BottomNavigationBarType.shifting,
            selectedItemColor: theme.primary,
            unselectedItemColor: theme.secondary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}