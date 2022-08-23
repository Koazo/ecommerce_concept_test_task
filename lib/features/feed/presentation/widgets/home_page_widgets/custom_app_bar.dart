import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key, super.actions}) : super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      elevation: .0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.location_on_outlined,
            color: AppColors.mainOrange,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Moscow, Russia',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey,
          )
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      actions: actions,
    );
  }
}

AppBar customAppBar1([List<Widget>? actions]) {
  return AppBar(
    elevation: .0,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.location_on_outlined,
          color: AppColors.mainOrange,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Moscow, Russia',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.grey,
        )
      ],
    ),
    backgroundColor: AppColors.backgroundColor,
    actions: actions,
  );
}
