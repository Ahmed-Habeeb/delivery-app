class DeliveryBillsResponseModel {
  final DataModel data;
  final ResultModel result;

  DeliveryBillsResponseModel({required this.data, required this.result});

  factory DeliveryBillsResponseModel.fromJson(Map<String, dynamic> json) {
    return DeliveryBillsResponseModel(
      data: DataModel.fromJson(json['Data']),
      result: ResultModel.fromJson(json['Result']),
    );
  }
}

class DataModel {
  final List<DeliveryBillModel> deliveryBills;

  DataModel({required this.deliveryBills});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      deliveryBills: (json['DeliveryBills'] as List)
          .map((bill) => DeliveryBillModel.fromJson(bill))
          .toList(),
    );
  }
}

class DeliveryBillModel {
  final String billType;
  final String billNo;
  final String billSrl;
  final String billDate;
  final String billTime;
  final String billAmt;
  final String taxAmt;
  final String dlvryAmt;
  final String mobileNo;
  final String cstmrNm;
  final String rgnNm;
  final String cstmrBuildNo;
  final String cstmrFloorNo;
  final String cstmrAprtmntNo;
  final String cstmrAddrss;
  final String latitude;
  final String longitude;
  final String dlvryStatusFlg;

  DeliveryBillModel({
    required this.billType,
    required this.billNo,
    required this.billSrl,
    required this.billDate,
    required this.billTime,
    required this.billAmt,
    required this.taxAmt,
    required this.dlvryAmt,
    required this.mobileNo,
    required this.cstmrNm,
    required this.rgnNm,
    required this.cstmrBuildNo,
    required this.cstmrFloorNo,
    required this.cstmrAprtmntNo,
    required this.cstmrAddrss,
    required this.latitude,
    required this.longitude,
    required this.dlvryStatusFlg,
  });

  factory DeliveryBillModel.fromJson(Map<String, dynamic> json) {
    return DeliveryBillModel(
      billType: json['BILL_TYPE'] ?? '',
      billNo: json['BILL_NO'] ?? '',
      billSrl: json['BILL_SRL'] ?? '',
      billDate: json['BILL_DATE'] ?? '',
      billTime: json['BILL_TIME'] ?? '',
      billAmt: json['BILL_AMT'] ?? '',
      taxAmt: json['TAX_AMT'] ?? '',
      dlvryAmt: json['DLVRY_AMT'] ?? '',
      mobileNo: json['MOBILE_NO'] ?? '',
      cstmrNm: json['CSTMR_NM'] ?? '',
      rgnNm: json['RGN_NM'] ?? '',
      cstmrBuildNo: json['CSTMR_BUILD_NO'] ?? '',
      cstmrFloorNo: json['CSTMR_FLOOR_NO'] ?? '',
      cstmrAprtmntNo: json['CSTMR_APRTMNT_NO'] ?? '',
      cstmrAddrss: json['CSTMR_ADDRSS'] ?? '',
      latitude: json['LATITUDE'] ?? '',
      longitude: json['LONGITUDE'] ?? '',
      dlvryStatusFlg: json['DLVRY_STATUS_FLG'] ?? '',
    );
  }
}

class ResultModel {
  final int errNo;
  final String errMsg;

  ResultModel({required this.errNo, required this.errMsg});

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      errNo: json['ErrNo'] ?? 0,
      errMsg: json['ErrMsg'] ?? '',
    );
  }
}