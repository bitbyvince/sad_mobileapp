import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: TextStyle(fontSize: 20.sp)),
      ),
      body: Center(
        child: Text(
          'Register Screen Content',
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
}
