
class ServiceModel {
  List<ServiceData>? data;
  String? message;
  bool? status;
  ServiceModel({
    this.data,
    this.message,
    this.status,
  });

  
  ServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ServiceData>[];
      json['data'].forEach((v) {
        data!.add( ServiceData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }


}



class ServiceData {
 final int id;
 final String title;
 final String description;
 final String image;
 final String category;
 final int price;
  ServiceData({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });

  factory ServiceData.fromJson(Map<String,dynamic> json){
    return ServiceData(id: json['id'], 
    title: json['title'], description: json['description'],
     image: json['image'], category: json['category'],
      price: json['price']);
  }
 
}
