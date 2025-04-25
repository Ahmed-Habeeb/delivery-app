import '../entities/login_response_entity.dart';
import '../repos/auth_repository.dart';

class CheckDeliveryLogin {
  final AuthRepository repository;

  CheckDeliveryLogin({required this.repository});

  Future<LoginResponseEntity> call(
      String langNo, String dlvryNo, String password) async {
    return await repository.checkDeliveryLogin(langNo, dlvryNo, password);
  }
}