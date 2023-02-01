import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const DeliveryButton({
    Key? key,
    required this.label,
    this.width,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
