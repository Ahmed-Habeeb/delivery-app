import '../../domain/entities/login_response_entity.dart';
import '../../domain/repos/auth_repository.dart';
import '../data_source/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<LoginResponseEntity> checkDeliveryLogin(
      String langNo, String dlvryNo, String password) async {
    try {
      final model = await remoteDataSource.checkDeliveryLogin(
          langNo, dlvryNo, password);
      return LoginResponseEntity(
        deliveryName: model.data.deliveryName,
        errNo: model.result.errNo,
        errMsg: model.result.errMsg,
      );
    } catch (e) {

      throw Exception(' $e');
    }
  }
}