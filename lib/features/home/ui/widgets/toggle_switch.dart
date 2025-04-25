import 'package:delivery_app/core/theme/colors_manager.dart';
import 'package:delivery_app/features/home/ui/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(builder: (context, state) => Container(
      width: 200,
      height: 36.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background for the selected option
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: context.read<HomeCubit>().isNewSelected ? 0 : 100,
            child: Container(
              width: 100,
              height: 36.h,
              decoration: BoxDecoration(
                color: ColorsManager.mainColor, // Teal color for selected
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          // Toggle options
          Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    context.read<HomeCubit>().changeNewBillState(true);

                  },
                  child: Center(
                    child: Text(
                      'New',
                      style: TextStyle(
                        color:context.read<HomeCubit>(). isNewSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    context.read<HomeCubit>().changeNewBillState(false);

                  },
                  child: Center(
                    child: Text(
                      'Others',
                      style: TextStyle(
                        color:context.read<HomeCubit>(). isNewSelected ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}