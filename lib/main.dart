import 'package:flutter/material.dart';
import 'controllers/auth_controller.dart';
import 'utilities/router.dart';
import 'utilities/routes.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light)
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => AuthController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute:AppRoutes.login,
    
    
      ),
    );
  }
}

