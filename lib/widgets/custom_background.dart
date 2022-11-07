import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {

  String image;
  double size;


  CustomBackground({super.key ,required this.image,required this.size});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Image.asset(
            'assets/images/Group 3147.png',
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/Mask Group 3.png',height: height/3.7,)),
        Positioned(
            bottom: 2,
            left: 6,
            child: Image.asset(image,height: height/size,)),
      ],
    );
  }
}

