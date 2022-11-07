import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../services/active_phone_or_email.dart';
import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
class PhoneNumber extends StatelessWidget {
    PhoneNumber({Key? key}) : super(key: key);
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var myprovider= Provider.of<AuthController>(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                CustomBackground(
                  image: 'assets/images/vector.png',
                  size: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text:  'مرحباً ${myprovider.name} !',
                          fontWeight: FontWeight.w600,
                          color: kmaincolor,
                          font: 20,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'تأكيد التسجيل في التطبيق ',
                          color: kseconderycolor,
                          font: 18,),
                        const SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: CustomText(text: 'برجاء إدخال رقم الجوال لإرسال كود التحقق ', color: kmaincolor,
                            font: 12,),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                         CustomTextField(
                            hint:'رقم الجوال',
                            icon: Icons.phone_android_outlined,
                         type: TextInputType.number,
                           onSave: (val){
                            if(val!.length==11){
                               myprovider.currentMobileorEmail(val);
                               myprovider.currentType('phone');

                            }
                           
                           },
                         ),
                  
                        const SizedBox(
                          height: 40,
                        ),
                  
                  
                        CustomBtn(
                          text: 'إرسال',
                          onTap: () async{
                            if(globalKey.currentState!.validate()){
                              globalKey.currentState!.save();
                               try{
                           await ActiveEmailOrPhoneAPi().activeEmailOrPhone(
                              emailOrPhone: myprovider.mobileOremail!,
                               type: myprovider.type!).then((value) {
                                 ScaffoldMessenger.of(context)
                                      .showSnackBar( SnackBar(
                                    content: Text(value.message),
                                  ));
                               });
                              Navigator.pushNamed(context, AppRoutes.confirmCode);
                            }
                            catch(e){print(e.toString());}
                            }
                           

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
                                 try{
                             ActiveEmailOrPhoneAPi().activeEmailOrPhone(
                              emailOrPhone: myprovider.mobileOremail!,
                               type: myprovider.type!);

                            }catch(e){print(e.toString());}

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
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
