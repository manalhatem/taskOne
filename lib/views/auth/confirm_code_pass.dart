import 'package:flutter/material.dart';
import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field_otp.dart';
class ConfirmCodePass extends StatelessWidget {
  const ConfirmCodePass({Key? key}) : super(key: key);

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
                  image: 'assets/images/pass.png',
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
                        text: 'نسيت كلمة المرور',
                        color: kseconderycolor,
                        font: 18,),
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: CustomText(text: 'كود التحقق ', color: kmaincolor,
                          font: 16,),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Form(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextFieldOtp(save: (pin1){},),
                          CustomTextFieldOtp(save: (pin2){},),
                          CustomTextFieldOtp(save: (pin3){},),
                          CustomTextFieldOtp(save: (pin4){},),
                        ],
                      )),

                      const SizedBox(
                        height: 40,
                      ),
                      CustomBtn(
                        text: 'تأكيد ',
                        onTap: () {
                          // if true
                          Navigator.pushNamed(context, AppRoutes.changePassword);
                        },
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.recycling,color: kseconderycolor,size: 18,),
                          GestureDetector(
                            onTap: () {
                            },
                            child:
                            CustomText(
                              text: '  إعادة المحاولة',
                              color: kseconderycolor,
                              font: 14,),
                        ),
                        ],
                      ),
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


