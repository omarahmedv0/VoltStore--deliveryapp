
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomIconBottom extends StatelessWidget {
   CustomIconBottom({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.selected
  });
    bool selected ;

  IconData  icon;
   Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:Icon(icon, color: selected == true ?ColorsManager.primary : ColorsManager.grey,size: 30.sp,),
      
    );
  }
}
