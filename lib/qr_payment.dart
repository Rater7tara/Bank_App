import 'package:flutter/material.dart';

const Color primaryColor = Colors.deepPurple;
const Color secondaryColor = Colors.deepPurpleAccent;

class QrPaymentPage extends StatelessWidget {
  const QrPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          'QR payment Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
