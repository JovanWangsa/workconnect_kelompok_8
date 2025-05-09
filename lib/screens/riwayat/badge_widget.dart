import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String badgeName;

  const BadgeWidget({required this.badgeName});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: badgeName,
      child: Chip(
        avatar: Icon(Icons.star, color: Colors.amber),
        label: Text(badgeName),
        backgroundColor: Colors.yellow[100],
        elevation: 3,
      ),
    );
  }
}
