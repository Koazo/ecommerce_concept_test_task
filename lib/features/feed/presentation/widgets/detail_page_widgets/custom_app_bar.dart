import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
      child: SizedBox(
        width: 37,
        height: 37,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF010035),
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    ),
    elevation: .0,
    centerTitle: true,
    title: const Center(
      child: Text(
        'Product Details',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
    backgroundColor: AppColors.backgroundColor,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
        child: SizedBox(
          width: 37,
          height: 37,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainOrange,
              padding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ),
    ],
  );
}
