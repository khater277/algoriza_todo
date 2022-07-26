import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const AppBarButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Icon(icon,size: 22,),
      ),
    );
  }
}
