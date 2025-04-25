import '../entities/login_response_entity.dart';

abstract class AuthRepository {
  Future<LoginResponseEntity> checkDeliveryLogin(
      String langNo, String dlvryNo, String password);
}