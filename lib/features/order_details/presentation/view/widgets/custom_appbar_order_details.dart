import '../../../../../core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomAppbarOrderDetails extends StatelessWidget {
   CustomAppbarOrderDetails({
    super.key,
    required this.onTap,
    required this.title,
  });

  Function()? onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back_ios,
              color: ColorsManager.primary,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.5,
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 24.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
