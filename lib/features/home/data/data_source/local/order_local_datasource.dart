import '../../local_database/order_database.dart';
import '../../models/delivery_bills_response.dart';

abstract class OrderLocalDataSource {
  Future<void> cacheDeliveryBills(DeliveryBillsResponseModel response);
  Future<DeliveryBillsResponseModel?> getCachedDeliveryBills();
  Future<void> clearCache();
}

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  final OrderDatabase database;

  OrderLocalDataSourceImpl({required this.database});

  @override
  Future<void> cacheDeliveryBills(DeliveryBillsResponseModel response) async {
    // Cache delivery bills
    final bills = response.data.deliveryBills
        .map((bill) => {
      'bill_srl': bill.billSrl,
      'bill_type': bill.billType,
      'bill_no': bill.billNo,
      'bill_date': bill.billDate,
      'bill_time': bill.billTime,
      'bill_amt': bill.billAmt,
      'tax_amt': bill.taxAmt,
      'dlvry_amt': bill.dlvryAmt,
      'mobile_no': bill.mobileNo,
      'cstmr_nm': bill.cstmrNm,
      'rgn_nm': bill.rgnNm,
      'cstmr_build_no': bill.cstmrBuildNo,
      'cstmr_floor_no': bill.cstmrFloorNo,
      'cstmr_aprtmnt_no': bill.cstmrAprtmntNo,
      'cstmr_addrss': bill.cstmrAddrss,
      'latitude': bill.latitude,
      'longitude': bill.longitude,
      'dlvry_status_flg': bill.dlvryStatusFlg,
    })
        .toList();

    await database.insertDeliveryBills(bills);

    // Cache result
    await database.insertResult({
      'err_no': response.result.errNo,
      'err_msg': response.result.errMsg,
    });
  }

  @override
  Future<DeliveryBillsResponseModel?> getCachedDeliveryBills() async {
    final billsData = await database.getDeliveryBills();
    final resultData = await database.getResult();

    if (billsData.isEmpty || resultData == null) {
      return null;
    }

    final bills = billsData
        .map((data) => DeliveryBillModel(
      billType: data['bill_type'],
      billNo: data['bill_no'],
      billSrl: data['bill_srl'],
      billDate: data['bill_date'],
      billTime: data['bill_time'],
      billAmt: data['bill_amt'],
      taxAmt: data['tax_amt'],
      dlvryAmt: data['dlvry_amt'],
      mobileNo: data['mobile_no'],
      cstmrNm: data['cstmr_nm'],
      rgnNm: data['rgn_nm'],
      cstmrBuildNo: data['cstmr_build_no'],
      cstmrFloorNo: data['cstmr_floor_no'],
      cstmrAprtmntNo: data['cstmr_aprtmnt_no'],
      cstmrAddrss: data['cstmr_addrss'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      dlvryStatusFlg: data['dlvry_status_flg'],
    ))
        .toList();

    return DeliveryBillsResponseModel(
      data: DataModel(deliveryBills: bills),
      result: ResultModel(
        errNo: resultData['err_no'],
        errMsg: resultData['err_msg'],
      ),
    );
  }

  @override
  Future<void> clearCache() async {
    await database.clearCache();
  }
}