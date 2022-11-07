import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/constants.dart';

class CustomTextFieldOtp extends StatelessWidget {

  void Function(String?)? save;
  CustomTextFieldOtp({Key? key,required this.save}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      width: 64,
      child: TextFormField(
        style: const TextStyle(color: kseconderycolor),
        onChanged: (val){
          if(val.length==1){
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (pin1){},
        cursorColor: kmaincolor,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          fillColor: kinputField,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kinputField),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kseconderycolor)),
        ),
      ),
    );
  }
}