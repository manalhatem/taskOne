import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
   void Function(String?)? onSave;
  final TextInputType? type;
  String? Function(String?)? vali;
  void Function(String)? onchange;
   CustomTextField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.onSave,
     required this.type,
     this.vali,
     this.onchange,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:hint=='تاكيد كلمة المرور'?
      vali
     : (value){
    if(value!.isEmpty){
      return' من فضلك ادخل $hint';
    }
    return null;
  },
  onChanged: onchange,
      onSaved: onSave,
      keyboardType: type,
      cursorColor: kmaincolor,
      obscureText: hint.contains('المرور')?true:false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hint,
        hintStyle: TextStyle(color:Colors.grey[500] ,fontSize: 12),
        prefixIcon: Icon(icon,color:  Colors.grey[400],),
        fillColor: kinputField,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: kinputField),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kmaincolor)),
            errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      
    );
  }
}

