import 'package:canteen_app/presentation/order/widgets/payment_cash_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/components/spaces.dart';
import '../../../../../../core/constants/colors.dart';
import '../models/order_model.dart';
import 'payment_success_dialog.dart';


class PaymentQrisDialog extends StatelessWidget {
  final int price;

  const PaymentQrisDialog({
    Key? key,
    required this.price,
  }) : super(key: key);

  void _handlePaymentSuccess(BuildContext context) {
    final orderModel = OrderModel(
      paymentMethod: 'QRIS',
      nominalBayar: price,
      orders: [], // Provide necessary order details
      totalQuantity: 0, // Update with the actual quantity
      totalPrice: price, // Update with the actual total price
      idKasir: 'dummy_id', // Update with actual cashier ID
      namaKasir: 'dummy_name', // Update with actual cashier name
      transactionTime: DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
      isSync: false,
    );

    ProductLocalDatasource.instance.saveOrder(orderModel);
    Navigator.of(context).pop(); // Close the dialog
    showDialog(
      context: context,
      builder: (context) => PaymentSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: AppColors.primary,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Pembayaran QRIS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SpaceHeight(6.0),
          // Static QR code display (replace with actual QR code if needed)
          Container(
            width: 256.0,
            height: 256.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: const Center(
              child: Text('QR Code Here'), // Placeholder for QR code
            ),
          ),
          const SpaceHeight(5.0),
          const Text(
            'Scan QRIS untuk melakukan pembayaran',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SpaceHeight(10.0),
          ElevatedButton(
            onPressed: () => _handlePaymentSuccess(context),
            child: const Text('Konfirmasi Pembayaran'),
          ),
        ],
      ),
    );
  }
}
