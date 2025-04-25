import '../entities/delivery_bill_entity.dart';

abstract class OrderRepository {
  Future<List<DeliveryBillEntity>> getDeliveryBills({
    required String dlvryNo,
    required String langNo,
    required String billSrl,
    required String prcssdFlg,
  });
}