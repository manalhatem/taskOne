import '../helper/api.dart';
import '../models/active_email_model.dart';
import '../utilities/constants.dart';

class ActiveEmailOrPhoneAPi{
  Future<ActiveEmailOrphoneModel> activeEmailOrPhone({
     required String emailOrPhone,
     required String type})async{
    Map<String, dynamic> data=await Api().post(url: '$baseUrl/active-phone-or-email',body: {
      'email':emailOrPhone,
      'type':type,
    });
    return ActiveEmailOrphoneModel.fromJson(data);
  }
}

