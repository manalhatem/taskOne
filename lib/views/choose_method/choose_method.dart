import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
class ChooseMethod extends StatelessWidget {
  const ChooseMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myprovider= Provider.of<AuthController>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                CustomBackground(
                  image: 'assets/images/openlock.png',
                  size: 4,
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
                        text: 'مرحباً ${myprovider.name} !',
                        fontWeight: FontWeight.w600,
                        color: kmaincolor,
                        font: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'تأكيد التسجيل بالتطبيق ',
                        color: kseconderycolor,
                        font: 18,),
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: CustomText(text: 'برجاء تحديد واحد من الخيارات التالية لإرسال كود التحقق',
                          color: kmaincolor,
                          font: 12,),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomContainer(tap: (){
                        Navigator.pushNamed(context, AppRoutes.phoneNumber);
                      }, image: 'assets/images/mobile.png',
                          text1: 'رقم الجوال', text2: 'أدخل رقم الجوال لإرسال كود التحقق الخاص بك .'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomContainer(tap: (){
                        Navigator.pushNamed(context, AppRoutes.enterEmail);
                      }, image: 'assets/images/emailll.png',
                          text1: 'البريد الالكتروني', text2: 'أدخل البريد لإرسال كود التحقق الخاص بك .'),



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
