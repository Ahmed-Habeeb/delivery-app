import '../entities/delivery_bill_entity.dart';
import '../repos/order_repository.dart';

class GetDeliveryBills {
  final OrderRepository repository;

  GetDeliveryBills({required this.repository});

  Future<List<DeliveryBillEntity>> call({
    required String dlvryNo,
    required String langNo,
    required String billSrl,
    required String prcssdFlg,
  }) async {
    return await repository.getDeliveryBills(
      dlvryNo: dlvryNo,
      langNo: langNo,
      billSrl: billSrl,
      prcssdFlg: prcssdFlg,
    );
  }
}