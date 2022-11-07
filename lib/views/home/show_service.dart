import 'package:flutter/material.dart';
import '../../models/service_model.dart';
import '../../services/services.dart';
import '../../utilities/constants.dart';
import '../../widgets/custom_card.dart';

class ShowService extends StatelessWidget {
  const ShowService({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: kmaincolor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'الخدمات ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body:Padding(padding:const EdgeInsets.only(right: 15,left: 15,top: 60),
        child: FutureBuilder<List<ServiceData>>(
          future: AllServices().getAllService(),
          builder: (context,snapshot){
            //print(snapshot.data);
          if (snapshot.hasData) {
            List<ServiceData> products=snapshot.data!;
            return  GridView.builder(
              itemCount: products.length,
          clipBehavior: Clip.none,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 75,
            crossAxisSpacing: 6,
            childAspectRatio: 1.3
            )
           , itemBuilder: (context,index){
            return  CustomCard(product:products[index]);
          });   
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        })),
        
      ),
    );
  }
}