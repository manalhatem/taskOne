import 'package:flutter/material.dart';
import '../../utilities/constants.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                CustomBackground(
                  image: 'assets/images/lock.png',
                  size: 3.9,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text:  'مرحباً  !',
                        fontWeight: FontWeight.w600,
                        color: kmaincolor,
                        font: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'تغيير كلمة المرور',
                        color: kseconderycolor,
                        font: 18,),
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: CustomText(text:'تغيير كلمة المرور' , color: kmaincolor,
                          font: 16,fontWeight: FontWeight.w500,),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                       CustomTextField(
                          hint: 'كلمة المرور الجديده ',
                          icon: Icons.lock_outline,
                        onSave: (val){},
                        type: TextInputType.visiblePassword,

                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       CustomTextField(
                          hint: ' تاكيد كلمة المرور الجديده ',
                          icon: Icons.lock_outline,
                         type: TextInputType.visiblePassword,
                         onSave: (val){},
                       ),

                      const SizedBox(
                        height: 40,
                      ),


                      CustomBtn(
                        text: 'حفظ',
                        onTap: () {
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
