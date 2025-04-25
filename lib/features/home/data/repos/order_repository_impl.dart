import '../../domain/entities/delivery_bill_entity.dart';

import '../../domain/repos/order_repository.dart';
import '../data_source/local/order_local_datasource.dart';
import '../data_source/remote/order_remote_datasource.dart';
import '../models/delivery_bills_response.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final OrderLocalDataSource localDataSource;

  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<DeliveryBillEntity>> getDeliveryBills({
    required String dlvryNo,
    required String langNo,
    required String billSrl,
    required String prcssdFlg,
  }) async {
    try {
      // Try to fetch from remote
      final remoteResponse = await remoteDataSource.getDeliveryBills(
        dlvryNo: dlvryNo,
        langNo: langNo,
        billSrl: billSrl,
        prcssdFlg: prcssdFlg,
      );

      // Cache the remote response
      await localDataSource.cacheDeliveryBills(remoteResponse);

      return remoteResponse.data.deliveryBills
          .map((model) => DeliveryBillEntity(
        billSrl: model.billSrl,
        billDate: model.billDate,
        billAmt: model.billAmt,
        dlvryStatusFlg: model.dlvryStatusFlg,
      ))
          .toList();
    } catch (e) {
      // If remote fails, try to get cached data
      final cachedResponse = await localDataSource.getCachedDeliveryBills();
      if (cachedResponse != null) {
        return cachedResponse.data.deliveryBills
            .map((model) => DeliveryBillEntity(
          billSrl: model.billSrl,
          billDate: model.billDate,
          billAmt: model.billAmt,
          dlvryStatusFlg: model.dlvryStatusFlg,
        ))
            .toList();
      } else {
        rethrow;
        throw Exception('Failed to fetch delivery bills: $e');
      }
    }
  }
}