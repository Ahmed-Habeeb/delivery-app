import 'package:flutter/material.dart';

import 'order_card.dart';

class OthersList extends StatelessWidget {
  const OthersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          OrderCard(
            orderId: '1569987',
            status: 'delivering',
            totalPrice: '400 LE',
            date: '1/1/2020',
          ),
          OrderCard(
            orderId: '1569987',
            status: 'delivered',
            totalPrice: '400 LE',
            date: '1/1/2020',
          ),
          OrderCard(
            orderId: '1569987',
            status: 'delivered',
            totalPrice: '400 LE',
            date: '1/1/2020',
          ),
          OrderCard(
            orderId: '1569987',
            status: 'returned',
            totalPrice: '400 LE',
            date: '1/1/2020',
          ),
          OrderCard(
            orderId: '1569987',
            status: 'delivering',
            totalPrice: '400 LE',
            date: '1/1/2020',
          ),
          OrderCard(
            orderId: '1569987',
            status: 'delivered',
            totalPrice: '400 LE',
            date: '1/1/2020',
          ),
        ]
    );
  }
}
