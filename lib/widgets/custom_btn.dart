import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CustomBtn extends StatelessWidget {
  
  String text;
  void Function()? onTap;
   CustomBtn({
    Key? key,
    required this.text,
    required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/2.8,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kmaincolor,
              borderRadius: BorderRadius.circular(8)),
          child:  Center(
              child: Text(
            text,
            style:const TextStyle(
                color: Colors.white,
                fontSize: 12),
          )),
        ),
      ),
    );
  }
}