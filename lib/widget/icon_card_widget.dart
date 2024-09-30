import 'package:flutter/material.dart';
import 'package:notes_app_with_bloc_pattern/theme/theme_color.dart';

class iconCardWidget extends StatelessWidget {
  IconData icon;
  VoidCallback onPressed;
  iconCardWidget({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeAppColor.cardIconColor,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
          )),
    );
  }
}
