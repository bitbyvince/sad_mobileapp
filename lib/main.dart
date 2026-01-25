import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sad_mobileapp/screens/login_screen.dart';
import 'package:sad_mobileapp/screens/register_screen.dart';
import 'package:sad_mobileapp/screens/home_screen.dart';
import 'package:sad_mobileapp/screens/tabs/report_tab.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RespiraTrack',
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/home': (context) => const HomeScreen(),
            '/report': (context) => const ReportTab(),
          },
        );
      },
    );
  }
}
