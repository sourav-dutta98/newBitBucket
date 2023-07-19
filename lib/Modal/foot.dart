import 'package:flutter/material.dart';

class FootModal {
  final String name;
  final String iconName;
  FootModal(dynamic name, this.iconName) : name = name.toString();

  IconData getIconName() {
    switch (iconName) {
      case "language":
        return Icons.circle_rounded;
      case "forks":
        return Icons.fork_right_rounded;
      case "stargazers":
        return Icons.star_border;
      default:
        return Icons.album_rounded;
    }
  }
}
