

class LoginModel {

final Data? data;
final String message;
final bool status;
  LoginModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory LoginModel.fromjson(Map<String, dynamic> json){
    return LoginModel(
      data: json['data'] == null ? null: Data.fromjson(json['data']), 
      message: json['message'], 
      status: json['status']);
  }


}
//


class Data {
 final UserDate user;
 final String token;
  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromjson(Map<String ,dynamic> json){
    return 
     Data(
     user: UserDate.fromjson(json['user']),
     token: json['token']);
  }
}

//
class UserDate {
 final int id;
 final String name;
 final String phone;
 final String email;
final  String image;
final  bool is_notifiy;
  UserDate({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.is_notifiy,
  });

  factory UserDate.fromjson(Map<String, dynamic> json){
    return UserDate(
      id: json['id'], 
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
     image: json['image'],
     is_notifiy: json['is_notifiy']);
  }
  
}



