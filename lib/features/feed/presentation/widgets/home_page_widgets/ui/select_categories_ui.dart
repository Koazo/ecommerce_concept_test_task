import 'package:flutter/material.dart';

Padding selectCategoriesUI() {
  return Padding(
    padding: const EdgeInsets.only(top: 2.5, left: 17, bottom: 5),
    child: Row(
      children: [
        const Text(
          'Select Category',
          style: TextStyle(fontSize: 26, fontFamily: 'MarkProBold'),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'view all',
              style: TextStyle(color: Color(0xffff6e4e), fontSize: 16),
            ),
          ),
        ),
      ],
    ),
  );
}
