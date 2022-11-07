
import '../helper/api.dart';
import '../models/service_model.dart';
import '../utilities/constants.dart';

class AllServices{
  Future<List<ServiceData>> getAllService()async{
  Map<String,dynamic>  data=await Api().get(url: '$baseUrl/get-services');
  //print(data);

   List <ServiceData> serviceList=[];

   for (var i = 0; i < data.length; i++) {
    serviceList.add(ServiceData.fromJson(data['data'][i]));
   }
   return serviceList;

  }
  
}