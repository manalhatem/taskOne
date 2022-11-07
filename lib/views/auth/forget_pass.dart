import 'package:flutter/material.dart';
import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
                  image: 'assets/images/question.png',
                  size: 3.5,
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
                        child: CustomText(text: 'برجاء إدخال البريد الإلكتروني لإرسال كود التحقق ', color: kmaincolor,
                          font: 12,),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                       CustomTextField(
                          hint: 'البريد الالكتروني',
                          icon: Icons.email_outlined,
                       type: TextInputType.emailAddress,
                         onSave: (val){},
                       ),

                      const SizedBox(
                        height: 40,
                      ),


                      CustomBtn(
                        text: 'إرسال',
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.confirmCodePassword);
                        },
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'لم يتم الإرسال .',
                            color: kmaincolor,
                            font: 14,
                          ),
                          GestureDetector(
                            onTap: () {
                            },
                            child: const Text(
                              'إعادة المحاولة',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: kseconderycolor,
                                  decoration: TextDecoration.underline),
                            ),
                          )
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
