import 'package:flutter/material.dart';
import '../../../../../../core/assets/assets.gen.dart';
import '../../../../../../core/components/buttons.dart';
import '../../../../../../core/components/spaces.dart';
import 'label_value_widget.dart';

class PaymentSuccessDialog extends StatelessWidget {
  final String paymentType;
  final int totalQuantity;
  final String totalBill; // Assume this is formatted currency string
  final String cashierName;
  final String transactionDate;

  PaymentSuccessDialog({
    Key? key,
    this.paymentType = 'Cash', // Default value for demonstration
    this.totalQuantity = 1, // Default value for demonstration
    this.totalBill = '0', // Default formatted currency
    this.cashierName = 'John Doe', // Example cashier name
    String? transactionDate,
  })  : transactionDate = transactionDate ?? DateTime.now().toString(), // Use current date if not provided
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Assets.icons.done.svg()),
          const SpaceHeight(24.0),
          const Text(
            'Payment has been successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelValue(
            label: 'Payment Method',
            value: paymentType == 'QRIS' ? 'QRIS' : 'Cash',
          ),
          const Divider(height: 16.0),
          LabelValue(
            label: 'Total Quantity',
            value: totalQuantity.toString(),
          ),
          const Divider(height: 16.0),
          LabelValue(
            label: 'Total Bill',
            value: totalBill,
          ),
          const Divider(height: 16.0),
          LabelValue(
            label: 'Cashier Name',
            value: cashierName,
          ),
          const Divider(height: 16.0),
          LabelValue(
            label: 'Transaction Date',
            value: transactionDate, // Display static transaction date
          ),
          const SpaceHeight(20.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () {
                    // Logic to navigate back to dashboard can go here
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  label: 'Done',
                  fontSize: 12,
                ),
              ),
              const SpaceWidth(12.0),
              Flexible(
                child: Button.outlined(
                  onPressed: () {
                    // Placeholder for print action
                    // Implement printing logic if necessary
                  },
                  label: 'Print',
                  icon: Assets.icons.print.svg(),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
