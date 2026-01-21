import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(fontSize: 20.sp)),
      ),
      body: Center(
        child: Text('Login Screen Content', style: TextStyle(fontSize: 16.sp)),
      ),
    );
  }
}
