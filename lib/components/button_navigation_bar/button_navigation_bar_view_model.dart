import 'package:flutter/material.dart';

enum BottomBarOptionSize {
  large,
  medium,
  small,
}

enum IconStyle {
  large,
  medium,
  small,
}

enum BottomNavigationBarStyle {
  primary,
  secondary,
  tertiary,
}

class BottomBarItem {
  final IconData icon;
  final String label;

  BottomBarItem({
    required this.icon,
    required this.label,
  });
}

class BottomBarViewModel {
  final BottomBarOptionSize size;
  final BottomNavigationBarStyle style;
  final List<BottomBarItem> items;
  int selectedIndex;
  final Function(int) onItemSelected;

  BottomBarViewModel({
    required this.size,
    required this.style,
    required this.items,
    this.selectedIndex = 0,
    required this.onItemSelected,
  });
}
