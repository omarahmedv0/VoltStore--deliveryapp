// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors_manager.dart';

class CustomTextFieldAuth extends StatelessWidget {
  CustomTextFieldAuth(
      {super.key,
       this.controller,
      this.valid,
      this.obscureText,
      required this.lable,
      required this.hint,
      required this.suffIcon,
      required this.keyboardType,
      this.onTapIcon,
      });
  final TextEditingController? controller;
  final String? Function(String?)? valid;
  final String lable;
  final String hint;
  final Icon suffIcon;
  final bool? obscureText;
  TextInputType keyboardType;
  Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText??false ,
      controller: controller,
      validator: valid,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.primary, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: InkWell(onTap: onTapIcon , child: suffIcon),
        label: Container(margin: const EdgeInsets.symmetric(horizontal: 5), child: Text(lable)),
        labelStyle: TextStyle(
            fontSize: 15.sp,
            color: ColorsManager.black,
            fontWeight: FontWeight.w300),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 12.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
