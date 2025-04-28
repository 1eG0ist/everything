import 'dart:ui';
import 'package:flutter/material.dart';

class GlassDepressedFab extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const GlassDepressedFab({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  State<GlassDepressedFab> createState() => _GlassDepressedFabState();
}

class _GlassDepressedFabState extends State<GlassDepressedFab> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 56,
        height: 56,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: theme.primary.withOpacity(_isPressed ? 0.05 : 0.03),
                borderRadius: BorderRadius.circular(32),
                boxShadow: _isPressed
                    ? [
                  BoxShadow(
                    color: theme.surface.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 6,
                  ),
                ]
                    : [
                  BoxShadow(
                    color: theme.primary.withOpacity(0.1),
                    offset: const Offset(-3, -3),
                    blurRadius: 6,
                  ),
                  BoxShadow(
                    color: theme.surface.withOpacity(0.3),
                    offset: const Offset(3, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Center(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 100),
                  scale: _isPressed ? 0.95 : 1.0,
                  child: IconTheme.merge(
                    data: IconThemeData(
                      color: theme.primary,
                    ),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}