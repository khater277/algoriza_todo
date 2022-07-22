import 'package:flutter/material.dart';

class DefaultProgressIndicator extends StatelessWidget {
  final double width;
  final Color color;
  const DefaultProgressIndicator({Key? key, required this.width, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: width,
            color: color,
          ),
          const SizedBox(height: 6,),
        ],
      ),
    );
  }
}