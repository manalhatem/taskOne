import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../controllers/auth_controller.dart';
import '../../services/active_account.dart';
import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
class ConfirmCode extends StatefulWidget {
 
    const ConfirmCode({Key? key}) : super(key: key);

 
  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  String _otpCode='';
  final int _otpCodelenth=4;
  late FocusNode myFocuseNode;

  @override
  void initState() {
    super.initState();
    myFocuseNode=FocusNode();
    myFocuseNode.requestFocus();

    SmsAutoFill().listenForCode.call();

  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocuseNode.dispose();
    super.dispose();


  }

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
                        child: CustomText(text: 'كود التحقق ', color: kmaincolor,
                          font: 16,),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      // Form(
                      //   child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     CustomTextFieldOtp(save: (pin1){},),
                      //     CustomTextFieldOtp(save: (pin2){},),
                      //     CustomTextFieldOtp(save: (pin3){},),
                      //     CustomTextFieldOtp(save: (pin4){},),
                      //   ],
                      // )),
                      PinFieldAutoFill(
                        decoration: const UnderlineDecoration(
                          colorBuilder: FixedColorBuilder(kseconderycolor),
                          textStyle: TextStyle(fontSize: 20,color: kseconderycolor), 
                          ),
                          currentCode: _otpCode,
                          codeLength: _otpCodelenth,
                          onCodeChanged: ((p0) {
                            if(p0!.length==_otpCodelenth){
                              _otpCode=p0;
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          }),

                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      CustomBtn(
                        text: 'تأكيد ',
                        onTap: () async{
                          // if true
                         try {
                           await ActiveAccount().activeAcount(
                            emailOrPhone: myprovider.mobileOremail!, 
                            code: _otpCode,
                             type: myprovider.type!).then((value) {
                              if(value.data != null){
                                 ScaffoldMessenger.of(context)
                                      .showSnackBar( SnackBar(
                                    content: Text(value.message),
                                  ));
                                Navigator.pushNamed(context, AppRoutes.mainService);
                              }
                             });
                           
                         } catch (e) {
                          print(e.toString());
                           
                         }
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
    );  }
}
