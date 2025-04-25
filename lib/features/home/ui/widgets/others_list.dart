import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import 'empty_orders.dart';
import 'order_card.dart';

class OthersList extends StatelessWidget {
  const OthersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder:
          (context, state) =>
      context.read<HomeCubit>().otherBills.isEmpty
          ? EmptyOrders()
          : ListView.builder(
        itemBuilder: (context, index) {
          final bill = context.read<HomeCubit>().otherBills[index];
          // Map DLVRY_STATUS_FLG to status text and color
          String status;
          switch (bill.dlvryStatusFlg) {
            case '0':
              status = 'New';
              break;
            case '1':
              status = 'Delivering';
              break;
            case '2':
              status = 'Delivered';
              break;
            case '3':
              status = 'Returned';
              break;
            default:
              status = 'Unknown';
          }
         return  OrderCard(
            orderId:
            context.read<HomeCubit>().otherBills[index].billSrl,
            status: status,
            totalPrice:
            context.read<HomeCubit>().otherBills[index].billAmt,
            date:
            context.read<HomeCubit>().otherBills[index].billDate,
          );
        },
        itemCount: context.read<HomeCubit>().otherBills.length,
      ),
    );
      ListView(
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
