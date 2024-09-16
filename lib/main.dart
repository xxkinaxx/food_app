import 'package:flutter/material.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/ui/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PaymentPage(transaction: Transaction(
        id: 1,
        food: mockFoods[1],
        quantity: 5,
        total: (mockFoods[1].price! * 5 * 1.1).toInt() + 50000,
        dateTime: DateTime.now(),
        status: TransactionStatus.pending,
        user: mockUser
      ),),
      debugShowCheckedModeBanner: false,
    );
  }
}
