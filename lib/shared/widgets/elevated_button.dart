import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double rounded;
  final double height;
  final double width;
  final VoidCallback onPressed;
  const DefaultElevatedButton({Key? key, required this.child, required this.color, required this.rounded,
    required this.height, required this.width, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary:color,
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(rounded),
          ),
          minimumSize: Size(width,height)
      ),
      child:child,
    );
  }
}