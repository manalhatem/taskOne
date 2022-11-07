import 'package:flutter/material.dart';
import '../../services/login_api.dart';
import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? email, pass;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: globalKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  CustomBackground(
                    image: 'assets/images/ser.png',
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
                          text: 'مرحباً بعودتك !',
                          fontWeight: FontWeight.w700,
                          color: kmaincolor,
                          font: 20,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'تسجيل الدخول للمتابعه ',
                          color: kseconderycolor,
                          font: 16,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomText(
                          text: '     تسجيل الدخول',
                          color: kmaincolor,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hint: 'البريد الالكتروني',
                          icon: Icons.email_outlined,
                          onSave: (val) {
                            email = val;
                          },
                          type: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hint: 'كلمة المرور',
                          icon: Icons.lock,
                          onSave: (val) {
                            pass = val;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.forgetPassword);
                            },
                            child: CustomText(
                              text: 'نسيت كلمة المرور ؟ ',
                              color: kmaincolor,
                              font: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomBtn(
                          text: 'دخول',
                          onTap: () async {
                            if (globalKey.currentState!.validate()) {
                              globalKey.currentState!.save();
                              try {
                                await LogIn()
                                    .login(email: email!, password: pass!)
                                    .then((value) {
                                  // print(value.message);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(value.message),
                                  ));
                                  if (value.status) {
                                    Navigator.pushNamed(
                                        context, AppRoutes.mainService);
                                  }
                                });
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'ليس لدي حساب . ',
                              color: kmaincolor,
                              font: 14,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.register);
                              },
                              child: const Text(
                                'تسجيل جديد',
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
      ),
    );
  }
}
