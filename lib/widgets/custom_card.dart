import 'package:flutter/material.dart';

import '../models/service_model.dart';

class CustomCard extends StatelessWidget {

  ServiceData product;
   CustomCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 40,
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 0,
              offset:const Offset(8,8))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title.substring(0,12),style:const TextStyle(color: Colors.grey,fontSize: 16) ,),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price}',style:const TextStyle(color: Colors.black,fontSize: 14) ,),
    
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -50,
            child: Image.network(product.image,height: 95,width: 100,)),
        ],
      );

    
  }
}
