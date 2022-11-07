import '../helper/api.dart';
import '../models/register_model.dart';
import '../utilities/constants.dart';

class Register{
   Future <RegisterModel> register({
   required String name, 
   required String phone,
   required String email,
   required String password,
   required String confirm_password,
  })async{
     Map<String, dynamic> data=await Api().post(url: '$baseUrl/register',body: {
      'name':name,
      'phone':phone,
      'email':email,
      'password':password,
      'confirm_password':confirm_password,
      'token_firebase':'kghkghkghkghkhg',
      'device_id':'64564564564564',
    });
    return RegisterModel.fromjson(data);

  }
}