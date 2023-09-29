import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      this.onTap,
      required this.title,
      required this.ispadding,
      required this.logout,
      this.titleColor});
  bool? ispadding;
  bool? logout;
  Color? titleColor;
  void Function()? onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ispadding == true
          ? EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h)
          : EdgeInsets.zero,
      child: logout == true
          ? Row(
              children: <Widget>[
                 const Spacer(
                  flex: 2,
                ),
              Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!,
                ),
                const Spacer(),
                  Expanded(
                    child: InkWell(
                      onTap: onTap,
                      child: const Icon(
                        Icons.logout_outlined,
                        color: ColorsManager.primary,
                      ),
                    ),
                  ),
               
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: titleColor ?? ColorsManager.black,
                        )),
              ],
            ),
    );
  }
}
