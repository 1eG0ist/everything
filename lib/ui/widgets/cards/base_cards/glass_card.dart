import 'dart:ui';
import 'package:everything/ui/theme/sizes.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double borderRadius;
  final double blurSigma;
  final double opacity;

  const GlassCard({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius = 12.0,
    this.blurSigma = 2.0,
    this.opacity = 0.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                colors: [
                  // В зависимости от темы — разный градиент
                  (isDark ? Colors.white24 : Colors.white70).withOpacity(0.1),
                  (isDark ? Colors.white10 : Colors.white54).withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.4)
                      : Colors.white.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              color: Colors.white.withOpacity(0.05), // Лёгкий белый налет
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}