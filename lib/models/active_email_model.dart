class ActiveEmailOrphoneModel {

  final CodeData? codedata;
  final String message;
  final bool status;
  ActiveEmailOrphoneModel({
    required this.codedata,
    required this.message,
    required this.status,
  });

  factory ActiveEmailOrphoneModel.fromJson(Map<String,dynamic>json){
    return ActiveEmailOrphoneModel(
      codedata: json['codedata']==null? null: CodeData.fromJson(json['codedata']), 
      message: json['message'],
       status: json['status']);
  }
}

class CodeData {
  final String code;
  CodeData({
    required this.code,
  });
  factory CodeData.fromJson(Map<String,dynamic> json){
    return CodeData(code: json['code']);
  }
  
}
