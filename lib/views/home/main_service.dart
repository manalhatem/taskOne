import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_text.dart';
class MainService extends StatefulWidget {
  const MainService({Key? key}) : super(key: key);

  @override
  State<MainService> createState() => _MainServiceState();
}

class _MainServiceState extends State<MainService> {
   List<Map<String, dynamic>> data= [
      {"name":'نظافة مباني', "img":'assets/images/Group 179.png',"isSelected":true},
      {"name":'نظافة سيارات ', "img":'assets/images/Group 180.png',"isSelected":false},
      {"name":'تأجير حاويات', "img":'assets/images/Group 175.png',"isSelected":false},
      {"name":'ايجاروايتات', "img":'assets/images/Group 181.png',"isSelected":false},
      {"name":'خدمة وصيانه',"img":'assets/images/Group 2182.png',"isSelected":false},
      {"name":'خدمات حاويات ',"img":'assets/images/Group 2183.png',"isSelected":false},



    ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(onPressed: (){},
                         icon: const Center(child:  Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,))),
                      ),
                      const SizedBox(width: 16,),
                      CustomText(text: 'الخدمات الرئيسية', color: Colors.white,font: 20,)
  
                    ],
                  ),
                  Expanded(
          child: GridView.builder(
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing:12,
          crossAxisSpacing: 12), 
         itemCount:data.length ,
         itemBuilder: (context ,index) {
          return  Card(index,data[index]["isSelected"]);}),
      
    ),

                ],
              ),
            ),
          ),
    
      ),
    );
  }

 int currentindex=0;
Widget Card(index,bool selected){
  return GestureDetector(
       onTap: (){
        setState(() {
          data[currentindex]["isSelected"]= false;
          currentindex=index;
          data[currentindex]["isSelected"]= true;   
        });
        Navigator.pushNamed(context, AppRoutes.showService);
       },
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 22),
      decoration: BoxDecoration(
        color:selected? Colors.white.withOpacity(.4):Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
      children: [
        Image.asset(data[index]["img"]),
        const SizedBox(height: 20,),
        CustomText(text: data[index]["name"], color: kinputField,font: 14,),
                
      ],
                  ),),
    );
  }
}

