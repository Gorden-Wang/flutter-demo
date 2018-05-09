class HBCHttpResponse {

  final int httpStatus;
  final int resStatus;
  var resData;
  final String resMessage;



  HBCHttpResponse({this.httpStatus,this.resStatus, this.resData, this.resMessage});

  factory HBCHttpResponse.fromJson(Map<String, dynamic> json) {
    return new HBCHttpResponse(
      httpStatus:200,
      resStatus: json['status'],
      resData: json['data'],
      resMessage: json['message'],
    );
  }

  factory HBCHttpResponse.fromResponse(Map<String,dynamic> json) {
    return new HBCHttpResponse(
      httpStatus: json['status'],
      resStatus: json['body']['status'],
      resData: json['body']['data'],
      resMessage: json['body']['message'],
    );
  }

  Map<String,dynamic> data(){
    return new Map.of({
      'httpStatus': this.httpStatus,
      'resStatus': this.resStatus,
      'resData': this.resData,
      'resMessage': this.resMessage,
    });
  }






}
