import 'package:delivery_app/features/home/ui/cubit/home_cubit.dart';
import 'package:delivery_app/features/home/ui/widgets/empty_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_card.dart';

class NewList extends StatelessWidget {
  const NewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder:
          (context, state) =>
              context.read<HomeCubit>().newBills.isEmpty
                  ? EmptyOrders()
                  : ListView.builder(
                    itemBuilder: (context, index) {
                      return OrderCard(
                        orderId:
                            context.read<HomeCubit>().newBills[index].billSrl,
                        status: "New",
                        totalPrice:
                            context.read<HomeCubit>().newBills[index].billAmt,
                        date:
                            context.read<HomeCubit>().newBills[index].billDate,
                      );
                    },
                    itemCount: context.read<HomeCubit>().newBills.length,
                  ),
    );

    ListView(
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
      ],
    );
  }
}
