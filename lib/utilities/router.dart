import 'package:flutter/material.dart';
import '../views/auth/change_pass.dart';
import '../views/auth/forget_pass.dart';
import '../views/auth/login_view.dart';
import '../views/auth/register_view.dart';
import '../views/choose_method/choose_method.dart';
import '../views/choose_method/confirm_code.dart';
import '../views/choose_method/e_mail.dart';
import '../views/choose_method/phone_no.dart';
import '../views/auth/confirm_code_pass.dart';
import '../views/home/main_service.dart';
import '../views/home/show_service.dart';
import 'routes.dart';

Route<dynamic> onGenerate(RouteSettings settings){
  switch(settings.name){
    case AppRoutes.register:
    return MaterialPageRoute(builder: (context)=>  RegisterView());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context)=> const LoginView());
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (context)=> const ForgetPasswordView());
    case AppRoutes.confirmCodePassword:
      return MaterialPageRoute(builder: (context)=> const ConfirmCodePass());
    case AppRoutes.changePassword:
      return MaterialPageRoute(builder: (context)=> const ChangePassword());
    case AppRoutes.chooseMethod:
      return MaterialPageRoute(builder: (context)=> const ChooseMethod());
    case AppRoutes.phoneNumber:
      return MaterialPageRoute(builder: (context)=>  PhoneNumber());
    case AppRoutes.enterEmail:
      return MaterialPageRoute(builder: (context)=>  EnterEmail());
    case AppRoutes.confirmCode:
      return MaterialPageRoute(builder: (context)=>  const ConfirmCode());
    case AppRoutes.mainService:
      return MaterialPageRoute(builder: (context)=> const MainService());
    case AppRoutes.showService:
      return MaterialPageRoute(builder: (context)=> const ShowService());
     default:
      return MaterialPageRoute(builder: ((context) => const LoginView()));
  }


}