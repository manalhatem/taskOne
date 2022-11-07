import '../helper/api.dart';
import '../models/login_model.dart';
import '../utilities/constants.dart';

class LogIn{

  Future<LoginModel> login({required String email, required String password})async{
    Map<String, dynamic> data=await Api().post(url: '$baseUrl/login',body: {
      'email':email,
      'password':password,
      'token_firebase':'kghkghkghkghkhg',
      'device_id':'64564564564564',
    });
    return LoginModel.fromjson(data);
  }
}