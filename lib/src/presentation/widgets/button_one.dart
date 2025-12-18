import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final String title;
  final VoidCallback onTap; // ✅ Proper type for onTap

  const ButtonOne({
    super.key,
    required this.title,
    required this.onTap, // ✅ Make it required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // ✅ Use the passed callback
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: const Color(0xFF8066FF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Mooxy',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
