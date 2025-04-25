import 'dart:convert';
import 'package:delivery_app/core/api/api_client/base_dio.dart';

import '../../models/delivery_bills_response.dart';

abstract class OrderRemoteDataSource {
  Future<DeliveryBillsResponseModel> getDeliveryBills({
    required String dlvryNo,
    required String langNo,
    required String billSrl,
    required String prcssdFlg,
  });
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final BaseDio client;

  OrderRemoteDataSourceImpl({required this.client});

  @override
  Future<DeliveryBillsResponseModel> getDeliveryBills({
    required String dlvryNo,
    required String langNo,
    required String billSrl,
    required String prcssdFlg,
  }) async {
    final url =
        'GetDeliveryBillsItems';
    final body = jsonEncode({
      "Value": {
        "P_DLVRY_NO": dlvryNo,
        "P_LANG_NO": langNo,
        "P_BILL_SRL": billSrl,
        "P_PRCSSD_FLG": prcssdFlg,
      }
    });

    final response = await client.post(
      url,

      data: body,
    );

    if (response.success) {
      return DeliveryBillsResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch delivery bills: ${response.error}');
    }
  }
}