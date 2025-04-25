import 'package:delivery_app/features/home/ui/cubit/home_cubit.dart';
import 'package:delivery_app/features/home/ui/widgets/home_header.dart';
import 'package:delivery_app/features/home/ui/widgets/new_list.dart';
import 'package:delivery_app/features/home/ui/widgets/others_list.dart';
import 'package:delivery_app/features/home/ui/widgets/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder:
            (context, state) => Column(
              children: [
                HomeHeader(),
                SizedBox(height: 20.h),
                ToggleSwitch(),
                Expanded(
                  child:
                      context.read<HomeCubit>().isNewSelected
                          ? NewList()
                          : OthersList(),
                ),
                // EmptyOrders(),
              ],
            ),
      ),
    );
  }
}
