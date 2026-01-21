import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicCard extends StatelessWidget {
  final Widget child;

  const BasicCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        color: null,
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Padding(padding: EdgeInsets.all(16.w), child: child),
      ),
    );
  }
}
