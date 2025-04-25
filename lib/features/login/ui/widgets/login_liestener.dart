import 'package:delivery_app/core/helper/app_snack_bars.dart';
import 'package:delivery_app/core/helper/extensions.dart';
import 'package:delivery_app/features/login/ui/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/loading_dialog.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(context: context,
              barrierDismissible:  false,

              builder: (context) => LoadingDialog());
        } else if (state is AuthFailure) {
          context.pop();
          AppSnackBars.errorSnackBar(state.error);

        }
        else if (state is AuthSuccess) {
          context.pop();
          AppSnackBars.successSnackBar("Login Successful");
          String userID = context.read<AuthCubit>().userIDController.text;
          context.offAllNamed(Routes.home,arguments: userID);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
