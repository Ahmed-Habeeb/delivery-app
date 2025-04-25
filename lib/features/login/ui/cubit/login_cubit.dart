import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_response_entity.dart';
import '../../domain/usecases/check_delivery_login.dart';

part 'login_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final CheckDeliveryLogin checkDeliveryLogin;

  AuthCubit({required this.checkDeliveryLogin}) : super(AuthInitial());

  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> checkLogin(String langNo) async {
    emit(AuthLoading());
    try {
      final response = await checkDeliveryLogin(
        langNo,
        userIDController.text,
        passwordController.text,
      );
      emit(AuthSuccess(response: response));
      debugPrint("Login response: ${response.toString()}");
    } catch (e) {
      debugPrint("Login error: ${e.toString()}");

      emit(AuthFailure(error: e.toString().replaceAll('Exception: ', '')));
    }
  }
}
