import 'package:flutter/material.dart';

class HobbyModel {
  final String title;
  final String category;
  final String description;
  final IconData icon;
  final Color accentColor;

  const HobbyModel({
    required this.title,
    required this.category,
    required this.description,
    required this.icon,
    required this.accentColor,
  });
}
