import 'package:flutter/material.dart';

import 'order_card.dart';

class NewList extends StatelessWidget {
  const NewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderCard(
          orderId: '1569987',
          status: 'new',
          totalPrice: '400 LE',
          date: '1/1/2020',
        ),
        OrderCard(
          orderId: '1569987',
          status: 'new',
          totalPrice: '400 LE',
          date: '1/1/2020',
        ),
        OrderCard(
          orderId: '1569987',
          status: 'new',
          totalPrice: '400 LE',
          date: '1/1/2020',
        ),
        OrderCard(
          orderId: '1569987',
          status: 'new',
          totalPrice: '400 LE',
          date: '1/1/2020',
        ),
        OrderCard(
          orderId: '1569987',
          status: 'new',
          totalPrice: '400 LE',
          date: '1/1/2020',
        ),
        OrderCard(
          orderId: '1569987',
          status: 'new',
          totalPrice: '400 LE',
          date: '1/1/2020',
        ),
      ]
    );
  }
}
