import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../services/register_api.dart';
import '../../utilities/constants.dart';
import '../../utilities/routes.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? phone, email, password, confirmPass, passChange;

  @override
  Widget build(BuildContext context) {
    var myprovider = Provider.of<AuthController>(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Stack(
              children: [
                CustomBackground(
                  image: 'assets/images/man.png',
                  size: 4.2,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'مرحباً بك !',
                          fontWeight: FontWeight.w600,
                          color: kmaincolor,
                        ),
                        CustomText(
                            text: 'إنشاء حساب لبدء التطبيق',
                            color: kseconderycolor),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomText(text: '    تسجيل جديد', color: kmaincolor),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hint: 'اسم المستخدم',
                          icon: Icons.person_outline_sharp,
                          type: TextInputType.text,
                          onSave: (val) {
                            myprovider.changeName(val!);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hint: 'رقم الجوال',
                          icon: Icons.phone_android_outlined,
                          type: TextInputType.number,
                          onSave: (val) {
                            phone = val;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hint: 'البريد الالكتروني',
                          icon: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                          onSave: (val) {
                            email = val;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hint: 'كلمة المرور',
                          icon: Icons.lock,
                          type: TextInputType.visiblePassword,
                          onSave: (val) {
                            password = val;
                          },
                          onchange: (value) {
                            passChange = value;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            hint: 'تاكيد كلمة المرور',
                            icon: Icons.lock,
                            type: TextInputType.visiblePassword,
                            onSave: (val) {
                              confirmPass = val;
                            },
                            vali: (val) {
                              if (val!.isEmpty) {
                                return ' من فضلك أكد كلمة المرور';
                              }
                              if (val != passChange) {
                                return 'Not Match';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomBtn(
                          text: 'تسجيل',
                          onTap: () async {
                            if (globalKey.currentState!.validate()) {
                              globalKey.currentState!.save();
                              try {
                                Register()
                                    .register(
                                        name: myprovider.name!,
                                        phone: phone!,
                                        email: email!,
                                        password: password!,
                                        confirm_password: confirmPass!)
                                    .then((value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(value.message),
                                    backgroundColor: kinputField,
                                  ));
                                  if (value.status) {
                                    Navigator.pushNamed(
                                        context, AppRoutes.chooseMethod);
                                  }
                                });
                                // print('success');

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
                              text: 'لدي حساب بالفعل . ',
                              color: kmaincolor,
                              font: 14,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.login);
                              },
                              child: const Text(
                                'تسجيل دخول',
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
          )),
        ));
  }
}
