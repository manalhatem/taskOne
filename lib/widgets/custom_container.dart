import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'custom_text.dart';

class CustomContainer extends StatelessWidget {
  void Function()? tap;
  String image;
  String text1;
  String text2;
  CustomContainer({Key? key,required this.tap, required this.image,required this.text1,required this.text2}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:tap,
      child: DottedBorder(
        color: kseconderycolor,
        strokeWidth: 1,
        radius: const Radius.circular(20),
        child: Container(
          color: kinputField,
          padding:const EdgeInsets.all(18),
          child: Row(
            children: [
              Image.asset(image),
              const SizedBox(width: 18,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: text1,
                    color: kseconderycolor,
                    font: 12,),
                  const SizedBox(height: 10,),
                  CustomText(
                    text: text2,
                    color: Colors.black26,
                    font: 10,),

                ],
              ),
            ],
          ),

        ),
      ),
    );

  }
}

