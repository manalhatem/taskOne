import '../helper/api.dart';
import '../models/login_model.dart';
import '../utilities/constants.dart';

class ActiveAccount{
  Future<LoginModel> activeAcount({
     required String emailOrPhone,
     required String code,
     required String type,
     })async{
    Map<String, dynamic> data=await Api().post(url: '$baseUrl/active-code',body: {
      'phone_or_email':emailOrPhone,
      'code':code,
      'type':type,
    });
    return LoginModel.fromjson(data);
  }
}