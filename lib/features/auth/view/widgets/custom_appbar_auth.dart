// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/constants/colors_manager.dart';

class CustomAppBarAuth extends StatelessWidget {
  String text;
  CustomAppBarAuth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:const EdgeInsets.symmetric(
            vertical: 15 
          ),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorsManager.grey),
          ),
        ),
      ],
    );
  }
}
