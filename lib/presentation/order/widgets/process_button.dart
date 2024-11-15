import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ProcessButton extends StatelessWidget {
  final int price; // The price to be displayed
  final VoidCallback onPressed; // Callback for button press
  final String total; // Total price to be displayed

  const ProcessButton({
    super.key,
    required this.price,
    required this.onPressed,
    required this.total, // Accept the formatted total as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Handle tap event
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          color: AppColors.primary,
        ),
        child: Row(
          children: [
            // Display the total price
            Text(
              total, // Use the formatted total passed in
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            const Text(
              'Process',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceWidth(5.0),
            const Icon(
              Icons.chevron_right,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
