class LoginResponseModel {
  final DataModel data;
  final ResultModel result;

  LoginResponseModel({required this.data, required this.result});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      data: DataModel.fromJson(json['Data']),
      result: ResultModel.fromJson(json['Result']),
    );
  }
}

class DataModel {
  final String deliveryName;

  DataModel({required this.deliveryName});

  factory DataModel.fromJson(Map<String, dynamic> json) {

    return DataModel(
      deliveryName: json['DeliveryName'],
    );
  }
}

class ResultModel {
  final int errNo;
  final String errMsg;

  ResultModel({required this.errNo, required this.errMsg});

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      errNo: json['ErrNo'],
      errMsg: json['ErrMsg'],
    );
  }
}