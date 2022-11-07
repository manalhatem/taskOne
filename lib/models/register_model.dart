import 'login_model.dart';

class RegisterModel {
  UserDate? data;
  String message;
  bool status;
  RegisterModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory RegisterModel.fromjson(Map<String, dynamic> json){
    return RegisterModel(
      data: json['data'] == null ? null: UserDate.fromjson(json['data']),
     message: json['message'],
      status: json['status']);
  }

}

